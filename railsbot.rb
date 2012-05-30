require 'rubygems' # Suffer.
require 'summer'
require 'active_record'
Dir["lib/models/**/*.rb"].each { |f| require f }
$LOAD_PATH.unshift(File.dirname(__FILE__) + "/lib")
