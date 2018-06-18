class Image < ApplicationRecord
  belongs_to :imagable, polymorphic: true, inverse_of: :imagable
  mount_uploader :file, ImageUploader
end
