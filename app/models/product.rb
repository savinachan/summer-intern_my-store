class Product < ApplicationRecord
	#belongs_to :store

	scope :available, ->{ where(is_online: true) }
	scope :over_than, ->(x){ where(["price > ?", x]) }


	has_many :ware_houses
  has_many :stores, through: :ware_houses

  mount_uploader :image, ImageUploader

end
