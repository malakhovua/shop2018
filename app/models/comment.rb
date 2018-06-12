class Comment < ApplicationRecord
  belongs_to :product

  validates :nick, :text, :product, presence: true
  validates :nick, length: {in: 3..12}
  validates :text, length: {maximum: 140}


end
