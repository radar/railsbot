class Channel < ActiveRecord::Base
  has_many :messages
end