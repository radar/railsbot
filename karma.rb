require 'railsbot'

users = {}
match = /(thank you)|thanks|\+1/
Message.find_in_batches(100).each do |chat|
end