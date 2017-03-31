class OrdersController < ApplicationController
	layout 'auth'
	def new
		@order = Order.new
	end

	def create
	end

	private
	def order_params
		params.required(:order).permit(:product_id, :transaction_id, :qty, :amount, :data)
	end
end
