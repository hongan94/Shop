class CartItem < ApplicationRecord
	acts_as_shopping_cart_item_for :cart
	belongs_to :product

	validates :quantity, presence: true

	def total_price
		quantity * price_cents
	end
end
