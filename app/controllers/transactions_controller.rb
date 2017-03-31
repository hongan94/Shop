class TransactionsController < ApplicationController
	layout 'auth'
	before_filter :corvert, only: :create
	def new
		@transaction = Transaction.new
	end

	def create
		@transaction = Transaction.new(transaction_params)
		if @transaction.save
			@item = CartItem.where(owner_id: session[:cart_id])
			@total = 0
			@item.each do |item|
				@qty = item.quantity
				@product_id = item.item_id
				@amount = item.quantity * item.price_cents/100
				@total += item.total_price/100
				@order = @transaction.orders.create(qty: @qty, product_id: @product_id, amount: @amount)
				session[:cart_id] = nil
			end
			@transaction.update(amount: @total)
			flash[:notice] = "Bạn đã order thành công"
			redirect_to transactions_path
		else
			render 'new'
		end
	end

	private

	def transaction_params
		if current_user.present?
		params.required(:transaction).permit(:user_id, :user_name, :user_phone, :user_email, :user_address, :payment, :message)
		else
			params.required(:transaction).permit(:user_name, :user_phone, :user_email, :user_address, :payment, :message, :amount)
		end
	end

	def corvert
		params[:transaction][:payment] = params[:transaction][:payment].to_i
	end
end
