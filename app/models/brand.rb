class Brand < ApplicationRecord

	has_many :products
	mount_uploader :image, ImageUploader
end
