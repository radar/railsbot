class Tip < ActiveRecord::Base
  validates :owner, presence: true

  def owned_by?(nick)
    nick == owner || nick == 'radar'
  end
end
