module ApiLookups
  
  def update_api_command(stem, sender, reply_to, msg)
    return unless authorized?(sender[:nick])
    stem.message("Updating API index", sender[:nick])
    APILookup.update
    stem.message("Updated API index! Use the !lookup <method> or !lookup <class> <method> to find what you're after", sender[:nick])
    return nil
  end
  
  def lookup_command(stem, sender, reply_to, msg, opts={})
    parts = msg.split(" ")[0..-1].map { |a| a.split("#") }.flatten!
    results=APILookup.search(msg)
    opts.merge!(:stem => stem, :reply_to => reply_to)
    show_api_results(results,msg, opts)
    nil
  end

  def show_api_results(results,search_string, opts={})
    if results.empty?
      opts[:stem].message "I could find no API results matching `#{search_string}`.", opts[:reply_to]
    elsif results.size == 1
      display_api_url(results.first, opts)
    elsif results.size <= THRESHOLD
      results.each_with_index do |result, i|
        display_api_url(result, opts.merge(:number => i+1))
      end
    else
      opts[:stem].message "Please be more specific, we found #{results.size} results (threshold is #{THRESHOLD}).", opts[:reply_to]
    end
  end

  def display_api_url(result, opts={})
    s = opts[:number] ? opts[:number].to_s + ". " : ""
    # if we're a method then show the constant in parans
    s += "(#{result.constant.name}) " if result.is_a?(APILookup::Entry)
    s += "#{result.name} #{result.url}"
    opts[:stem].message("#{opts[:directed_at] ? opts[:directed_at] + ":"  : ''} #{s}", opts[:reply_to])
  end    
  
end
