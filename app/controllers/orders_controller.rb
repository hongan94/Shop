class OrdersController < ApplicationController
	layout 'auth'
	def new
		@order = Order.new
	end

	def create
		@order = Order.new(params_order)
		if @order.save
			flash[:notice] = "Bạn đã order thành công"
		end
	end

	private
	def order_params
		params.required(:order).permit(:product_id, :transaction_id, :qty, :amount, :data)
	end
end
