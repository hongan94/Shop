class Bigcategory < ApplicationRecord
	has_many :categories, dependent: :destroy
	validates :name , presence: true

	mount_uploader :image, ImageUploader
end
