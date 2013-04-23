class Message < ActiveRecord::Base
  self.inheritance_column = nil
  belongs_to :person
  belongs_to :channel
end
