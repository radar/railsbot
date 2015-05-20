# encoding: utf-8
require 'rubygems'
require 'bundler/setup'
require 'benchmark'
require 'active_support/core_ext/class/attribute_accessors'
require 'active_record'
require 'yaml'

config = YAML::load_file("config/summer.yml")

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || config["database"])

ActiveRecord::Schema.define do
  create_table :channels, :force => true do |t|
    t.string :name
    t.boolean :hidden, :default => false
  end
   
  create_table :constants, :force => true do |t|
    t.string :name, :url
    t.integer :api_id
  end
  
  add_index :constants, :api_id
   
  create_table :entries, :force => true do |t|
    t.string :name, :url
    t.integer :constant_id
  end
  
  add_index :entries, :constant_id
   
  create_table :messages, :force => true do |t|
    t.string :text
    t.string :type
    t.integer :channel_id
    t.integer :person_id
    t.boolean :hidden, :default => false
    t.timestamps
  end
   
  create_table :people, :force => true do |t|
    t.string :nick, :hostname
    t.boolean :authorized, :default => false
  end
  
  create_table :tips, :force => true do |t|
    t.string :command
    t.text :text
  end
end

Dir["lib/models/*.rb"].each { |f| require_relative f }
