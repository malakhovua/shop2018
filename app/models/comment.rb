require './lib/ws_queue'

class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user



  delegate :full_name, to: :user, prefix: true

  validates :text, :product, presence: true
  validates :text, length: {maximum: 140}

  after_commit :notify!

  def as_json(_)
    {
    id: id,
    text: text,
    nick: user_full_name || 'Guest'
    }
  end

  private

  def notify!
    WSQueue.publish_comment('comments.new', self)
  end

end


