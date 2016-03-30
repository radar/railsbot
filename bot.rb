# encoding: UTF-8
$:.unshift(File.dirname(__FILE__))
require 'bundler/setup'
require 'railsbot'
require 'json'
require 'httparty'
require 'nokogiri'
require 'redis'

require 'lib/user_nuker'

if ENV['MIGRATE']
  puts "------> Running migrations:"
  require 'migration'
end

class Bot < Summer::Connection

  BALL8_TIPS = YAML.load(File.read(File.join(File.dirname(__FILE__), 'config', '8ball.yml')))
  REASON_TIPS = YAML.load(File.read(File.join(File.dirname(__FILE__), 'config', 'reasons.yml')))
  OPS = YAML.load(File.read(File.join(File.dirname(__FILE__), 'config', 'ops.yml')))

  CONFIG = YAML::load_file("config/summer.yml")
  def did_start_up
    ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || config['database'])
    privmsg("Bot started up at #{Time.now.strftime("%d %B %Y %H:%M")}", CONFIG['owner'])
    @pastebin_dumbass = {}
    @redis = Redis.new
  end

  def auth_command(*args)
    privmsg("identify #{config['nickserv_password']}", "nickserv")
  end

  def authorize_command(sender, reply_to, msg, opts={})
    return unless authorized?(sender[:nick]) && sender[:nick].downcase == "radar"
    p = person(msg)
    p.authorized = true
    p.save!
    privmsg("#{msg} is now authorized to (ab)use me.", sender[:nick])
  end

  def gitlog_command(sender, reply_to, msg, opts={})
    return unless authorized?(sender[:nick])
    privmsg(`git log -1`.split("\n").first, reply_to)
  end

  def tip_command(sender, reply_to, command, options={})
    return unless authorized?(sender[:nick])
    if tip = Tip.find_by_command(command.strip)
      tip.text.gsub!("{nick}", sender[:nick])
      message = tip.text

      message.gsub!("{nick}", sender[:nick])

      if options[:directed_at]
        if tip.text =~ /{target}/
          message.gsub!("{target}", options[:directed_at])
        else
          message = "#{options[:directed_at]}: #{message}"
        end
      end

      privmsg(message, reply_to)
      log({ :nick => config[:nick]}, reply_to, message)
    end
  end

  def seen_command(sender, reply_to, nick, opts={})
    return unless authorized?(sender[:nick])
    nick = opts[:directed_at] if nick.nil? || nick.empty?
    return if nick.nil?
    if sender[:nick].downcase == nick.downcase
      privmsg("Looked in a mirror recently? Oh? Poor mirror.", reply_to)
    else
      p = Person.find_by_nick(nick)
      if p
        last_chat = p.messages.joins(:channel).
                    where("channels.hidden = ?", false).
                    order("messages.created_at DESC").
                    first
      end

      if last_chat
        time = last_chat.created_at.strftime("%d %B %Y, %H:%M%p")
        privmsg("I last saw #{nick} on ##{last_chat.channel.name} at #{time} (UTC), they said #{last_chat.text.inspect}", reply_to)
      else
        privmsg("Who's #{nick}?", reply_to)
      end
    end
  end

  def since_command(sender, reply_to, nick, opts={})
    return unless authorized?(sender[:nick])
    nick = opts[:directed_at] if nick.nil? || nick.empty?

    p = Person.find_insensitive(nick)
    if p
      if p.messages.exists?
        first_message_date = p.messages.order("id ASC").first.created_at.to_date
        first_log_date = Message.order(:id).first.created_at.to_date
        duration = (Date.today - first_message_date).to_i
        message =  "I first saw #{nick} on #{first_message_date}. They've been around now for #{duration} days."
        if first_message_date == first_log_date
          message += " However, this was the first day I started logging, so they could've been around longer than that."
        end
      else
        message = "I know that name, but I don't know whenfrom. They haven't been around for quite a while."
      end
    else
      message = "Who is #{nick}?"
    end

    privmsg(message, reply_to)
  end


  def whois_command(sender, reply_to, nick, opts={})
    return unless authorized?(sender[:nick])
    nick = opts[:directed_at] if nick.nil? || nick.empty?
    p = Person.where(:nick => nick).first
    if p
      privmsg("http://logs.ryanbigg.com/p/#{nick}", reply_to)
    else
      privmsg("Who is #{nick}?", reply_to)
    end
  end

  def gem_command(sender, reply_to, gem_name, opts={})
    return unless authorized?(sender[:nick])
    message = "http://www.rubygems.org/gems/#{gem_name}"
    direct_at(reply_to, message, opts[:directed_at])
  end

  def gs_command(sender, reply_to, msg, opts={})
    return unless authorized?(sender[:nick])
    search("http://www.rubygems.org/search", sender, msg, reply_to, opts, 'search')
  end

  def join_command(sender, reply_to, msg, opts={})
    join(msg) if authorized?(sender[:nick])
  end

  def say_command(sender, reply_to, msg, opts={})
    return unless authorized?(sender[:nick])
    chan, msg = msg.split(" ", 2)
    begin
      privmsg(msg, chan)
    rescue
      # The channel is user-input, and if it's a non-existent channel can crash the bot.
      # Replying back to the attempt here instead if something goes wrong.
      privmsg("Sorry, could not say that", reply_to)
    end
  end

  def part_command(sender, reply_to, msg, opts={})
    part(msg) if authorized?(sender[:nick])
  end

  def google_command(sender, reply_to, msg, opts={})
    search("http://www.google.com/search", sender, msg, reply_to, opts)
  end

  alias :g_command :google_command

  def gg_command(sender, reply_to, msg, opts={})
    search("http://lmgtfy.com/", sender, msg, reply_to, opts)
  end

  def railscast_command(sender, reply_to, msg, opts={})
    search("http://railscasts.com/episodes", sender, msg, reply_to, opts, "search")
  end

  def githubs_command(sender, reply_to, msg, opts={})
    search("http://github.com/search", sender, msg, reply_to, opts)
  end

  def github_command(sender, reply_to, msg, opts={})
    parts = msg.split(/\/| /)
    if parts.empty?
      message = "http://github.com - Social code hosting using Git"
    else
      message = "http://github.com/#{parts[0]}/"
      message += "#{parts[1]}/" if parts[1]
      message += "tree/#{parts[2]}" if parts[2]
      message += "/#{parts[3..-1].join("/")}" if !parts[3].nil?
    end
    direct_at(reply_to, message, opts[:directed_at])
  end

  def ghstatus_command(sender, reply_to, msg, opts={})
    response = HTTParty.get('https://status.github.com/api/last-message.json').parsed_response
    message = response["body"] + " (https://status.github.com/)"

    case response["status"]
      when "minor"
        privmsg("GitHub is currently experiencing MINOR PROBLEMS. #{message}", reply_to)
      when "major"
        privmsg("GitHub is currently experiencing MAJOR PROBLEMS. #{message}", reply_to)
      else
        privmsg("GitHub status: #{message}", reply_to)
    end
  end

  def railsapi_command(sender, reply_to, msg, opts={})
    search("http://api.rubyonrails.org", sender, msg, reply_to, opts)
  end

  def rubyapi_command(sender, reply_to, msg, opts={})
    search("http://ruby-doc.org/search.html", sender, msg, reply_to, opts)
  end

  def add_command(sender, channel, message, opts={})
    return unless authorized?(sender[:nick])
    message = message.split(" ")
    return if message.empty?
    Tip.find_by_command(message[0]) || Tip.create!(:command => message[0], :text => message[1..-1].join(" "))
    privmsg("The !#{message[0]} command is now available.", channel == me ? sender[:nick] : channel)
  end

  def forget_command(sender, channel, message, opts={})
    return unless authorized?(sender[:nick]) && sender[:nick].downcase == "radar"
    message = message.split(" ")
    Tip.find_by_command(message[0]).try(:destroy)
    privmsg("The !#{message[0]} command has been deleted.", channel == me ? sender[:nick] : channel)
  end

  def help_command(sender, channel, message, opts={})
    privmsg("I need somebody! !help. Not just anybody. !help. You know I need someone. !help", channel == me ? sender[:nick] : channel)
  end

  define_method "8ball_command" do |sender, channel, message, opts={}|
    direct_at(channel, BALL8_TIPS[rand(BALL8_TIPS.size)], opts[:directed_at])
  end

  define_method "reason_command" do |sender, channel, message, opts={}|
    direct_at(channel, REASON_TIPS[rand(REASON_TIPS.size)], opts[:directed_at])
  end

  def when_command(sender, channel, message, opts={})
    estimate = Time.now + rand(10000).days
    direct_at(channel, "Calculating estimated date from all known knowledge... Best estimate: #{estimate.to_date} (or there abouts).")
  end

  def where_command(sender, channel, message, opts={})
    latitude = opts.fetch(:latitude, rand(-90.0000...90.0000))
    longitude = opts.fetch(:longitude, rand(-180.0000...180.0000))

    url = "https://www.google.com/maps/@#{latitude},#{longitude},7z"
    msg = ""
    msg += "#{opts[:directed_at]}: " if opts[:directed_at]
    msg += "Meet here: #{url}"

    direct_at(channel, msg)
  end

  def channel_message(sender, channel, message, options={})
    # try to match a non-existent command which might be a tip
    spam_protection(sender, channel, message)
    naughty_word_detection(sender, channel, message)
    log(sender, channel, message)
    tip_me(sender, channel, message)
    pastebin_sucks(sender, channel, message)
  end

  alias_method :private_message, :channel_message

  def spam_protection(sender, channel, message)
    return if authorized?(sender[:nick])
    key = "irc-#{sender[:nick]}"
    count = @redis.get(key)
    unless count
      @redis.set(key, 1)
      @redis.expire(key, 20)
      return
    end

    count = @redis.incr(key)
    if count >= 10
      notified_key = "notified-radar-about-#{sender[:nick]}"
      notified = @redis.get(notified_key)
      unless notified
        @redis.set(notified_key, 1)
        @redis.expire(notified_key, 300)
        message = "#{sender[:nick]} is spamming in #{channel}"
        channel = ruby_channel?(channel) ? "#ruby-ops" : "Radar"
        privmsg(message, channel)
      end
    end
  end

  def naughty_word_detection(sender, channel, message)
    bad_words = ["nigger"]
    bad_word = bad_words.detect { |word| message.include?(word) }
    if bad_word && !authorized?(sender[:nick])
      privmsg("#{sender[:nick]} said #{bad_word} in #{channel}", "#ruby-ops")
    end
  end

  def count_command(sender, channel, message, opts={})
    privmsg("I know of #{Tip.count} ways to entertain you.", channel)
  end

  # Important command for Aeyrix
  def mods_command(sender, channel, message, opts={})
    return unless authorized?(sender[:nick])
    privmsg("baweaver bricker mikecmpbll Necromancer Radar sevenseacat smathy workmad3", channel)
  end
  alias :ops_command :mods_command

  def mute_command(sender, channel, message, opts={})
    if OPS.include?(sender[:nick])
      message_parts = message.split
      privmsg("quiet #{channel} #{message_parts[0]}", "chanserv")
    end
  end

  def unmute_command(sender, channel, message, opts={})
    if OPS.include?(sender[:nick])
      message_parts = message.split
      privmsg("unquiet #{channel} #{message_parts[0]}", "chanserv")
    end
  end

  def ping_command(sender, channel, message, opts={})
    privmsg("!pong", sender[:nick])
  end

  def mode_event(sender, channel, *mode)
    log(sender, channel, mode.join(" "), "mode")
  end

  def kick_event(sender, channel, victim, message)
    # message contains channel name for whatever reason
    reason = message.split(" ")[1..-1].join(" ")
    log(sender, channel, "#{sender[:nick]} kicked #{victim}: #{reason}", "kick")
  end

  def join_event(joiner, channel)
    check_username(joiner, channel)
    check_for_anonymous_kiwiirc(joiner, channel)
    log(joiner, channel, "has joined #{channel}", "join")
  end

  def part_event(parter, channel, message)
    log(parter, channel, "has left #{channel}: (#{message})", "part")
  end

  def quit_event(quitter, message)
    log(quitter, "", message, "quit")
  end

  private

  def ruby_channel?(channel)
    ["#ruby", "#ruby-ops", "#ruby-offtopic", "#ruby-community"].include?(channel)
  end

  def tip_me(sender, channel, message)
    return if ruby_channel?(channel)

    if m = /^(([^:]+)[:|,])?\s?!([^\s]+)\s?(.*)?/.match(message)
      cmd_sym = "#{m[3]}_command".to_sym
      # if we don't respond to this command then it's likely a tip
      if respond_to?(cmd_sym)
        if !m[2].nil?
          send(cmd_sym, sender, channel, m[4], { :directed_at => m[2] })
        end
      else
        tip_command(sender,channel, m[3], { :directed_at => m[2] })
      end
    end
  end

  def pastebin_sucks(sender, channel, message)
    if %w[#rubyonrails #ruby].include?(channel.downcase)
      if m = /http:\/\/.*?pastebin.com\/(?!raw)/i.match(message)
        dumbass = @pastebin_dumbass[sender[:nick]]
        if dumbass.nil? || dumbass < Time.now.to_i - 300
          privmsg("Hi #{sender[:nick]}. We in #{channel.downcase} would really appreciate it if you did not use pastebin during your time with us.", channel)
          privmsg("Pastebin is not good because it loads slowly for most, has ads which are distracting and has terrible formatting. Please use Gist (http://gist.github.com) or Pastie (http://pastie.org) instead. Thanks!", channel)
        else
          privmsg("Hi again #{sender[:nick]}. If you continue to use pastebin in #{channel.downcase}, much scorn will be heaped upon you. Please use Gist (http://gist.github.com or Pastie (http://pastie.org) instead. Thanks!", sender[:nick])
        end
        @pastebin_dumbass[sender[:nick]] = Time.now.to_i
      end
    end
  end

  def log(sender, channel, message, type='message')
    name = channel.gsub("#", '')
    channel = Channel.where("NAME ILIKE ?", name).first
    channel = Channel.create!(:name => name) if channel.nil?
    person = person(sender[:nick])
    channel.messages.create!(:person => person,
                             :text => message,
                             :type => type,
                             :hidden => channel.hidden)
  end

  def direct_at(reply_to, message, who=nil)
    message = who + ": #{message}" if who
    privmsg(message, reply_to)
  end

  def search(host, sender, msg, reply_to, opts, query_parameter="q")
    message = "#{host}?#{query_parameter}=#{msg.split(" ").join("+")}"
    direct_at(reply_to, message, opts[:directed_at])
  end

  def person(nick)
    person = Person.find_by("nick ILIKE ? ESCAPE ''", nick)
    person ||= Person.create(nick: nick)
  end

  # Who's there?

  def authorized?(nick)
    Person.where("nick ILIKE ? AND authorized = ?", nick, true).exists?
  end

  def check_username(user, channel)
    score = UserNuker.new(user[:nick]).is_bad?
    if score > 0 && ruby_channel?(channel)
      privmsg("#{user[:nick]} (#{user[:hostname]}) has joined #{channel} with a bad nick. Score: #{score}.", "#ruby-ops")
    end
  end

  def check_for_anonymous_kiwiirc(user, channel)
    if user[:hostname].include?("kiwiirc") && !Person.where("nick ILIKE ?", user[:nick]).exists?
      privmsg("Unknown KiwiIRC user detected: #{user[:nick]} (#{user[:hostname]}) has joined #{channel}.", "#ruby-ops")
    end
  end
end


Bot.new(ARGV[0], ARGV[1] || 6667)
