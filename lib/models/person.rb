class Person < ActiveRecord::Base
  has_many :messages

  def self.find_insensitive(nick)
    self.where("lower(name) = ?", name.downcase).first
  end
end
