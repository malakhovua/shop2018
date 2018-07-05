class Product < ApplicationRecord
  has_many :comments
  has_many :commented_users, through: :comments,
           source: :user
  has_many :uniq_commented_users, -> { uniq },
           through: :comments,
           source: :user



  has_many :images, as: :imagable, inverse_of: :imagable

  accepts_nested_attributes_for :images, allow_destroy: true

  validates :price, :name, presence: true
  validates_uniqueness_of :name

  before_validation do
    puts 'before_validation'
  end
  before_save do
    puts 'before_save'
  end
  before_create do
    puts 'before_create'
  end
  before_update do
    puts 'before_update'
  end
  before_commit do
    puts 'before_commit'
  end

  after_validation do
    puts 'after_validation'
  end
  after_save do
    puts 'after_save'
  end
  after_create do
    puts 'after_create'
  end
  after_update do
    puts 'after_update'
  end
  after_commit do
    puts 'after_commit'
  end


end
