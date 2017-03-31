class Brand < ApplicationRecord

	has_many :products, dependent: :destroy
	mount_uploader :image, ImageUploader
end
