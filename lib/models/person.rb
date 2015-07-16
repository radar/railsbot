class Person < ActiveRecord::Base
  has_many :messages

  def self.find_insensitive(nick)
    self.where("lower(nick) = ?", nick.downcase).first
  end
end
