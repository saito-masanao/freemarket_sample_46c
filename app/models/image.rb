class Image < ApplicationRecord
<<<<<<< HEAD
  belongs_to :item
=======
  belongs_to :item, optional: true
  mount_uploader :image, ImageUploader
>>>>>>> YKKISKW/master
end
