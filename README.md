# Railsbot

This is the channel bot ("helpa") for #rubyonrails. It is used so people don't have to type things over and over again.

You can run the bot yourself with `ruby bot.rb irc.freenode.net`.

# Heroku
Configure your bot in `config/summer.yml`

First set the required config vars

`heroku config:set RAILS_BOT_IRC_SERVER=irc.freenode.net`

`heroku config:set RAILS_BOT_IRC_PORT=6667`

next run required database migrations

`heroku run ruby migration.rb`

next configure heroku to use a bot worker

`heroku ps:scale bot=1`

**Database settings**

The database settings in summer.yml will automatically be overwritten by heroku's DATABASE_URL environment variable so that its an effortless setup to use heroku postgres.
