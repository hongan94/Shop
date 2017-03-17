class Product < ApplicationRecord
	belongs_to :category
	belongs_to :brand

	mount_uploader :image, ImageUploader
end
