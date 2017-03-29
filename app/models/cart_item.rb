class CartItem < ApplicationRecord
	acts_as_shopping_cart_item_for :cart
	belongs_to :products

	validates :quantity, presence: true

	def total_price
		self.quantity * self.price_cents
	end
end
