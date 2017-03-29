class Category < ApplicationRecord
	belongs_to :bigcategory
	has_many :products
	validates :name, presence: true
	mount_uploader :image, ImageUploader
end
