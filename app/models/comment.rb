class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user

  delegate :full_name, to: :user, prefix: true

  validates :text, :product, presence: true
  validates :text, length: { maximum: 140 }

   after_commit :notify!

  def as_json(_ = nil)
    {
        id: id,
        product_id: product_id,
        user_id: user_id,
        text: text,
        nick: user_full_name || 'Guest'
    }
  end

  private

  def notify!
    action = if self.persisted?
               'comments.new'
             else
               'comments.destroy'
             end
    Pusher.trigger('broadcast', action, self.as_json)
    # WsQueue.publish(action, self)
  end
end
