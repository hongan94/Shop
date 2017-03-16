class Category < ApplicationRecord
	belongs_to :bigcategory
	has_many :products

	mount_uploader :image, ImageUploader
end
