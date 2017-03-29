class CartItem < ApplicationRecord
	acts_as_shopping_cart_item_for :cart
	belongs_to :products

	validates :quantity, presence: true

	def total_price
		self.quantity * self.price_cents
	end

	def discount(product)
		discount = 0
		product.each do |item|
			discount += item.quantity * (item.price_cents/100)
		end
		if discount > 500000
			discount = (5/100)
		end
	end
end
