class TransactionsController < ApplicationController
	layout 'auth'
	def new
		@transaction = Transaction.new
	end

	def create
		@transaction = Transaction.new(transaction_params)
		if @transaction.save
			flash[:notice] = "Bạn đã order thành công"
			redirect_to transactions_path
		end
	end

	private

	def transaction_params
		if current_user.present?
		params.required(:transaction).permit(:user_id, :user_name, :user_phone, :user_email, :user_address, :payment, :message)
		else
			params.required(:transaction).permit(:user_name, :user_phone, :user_email, :user_address, :payment, :message)
		end
	end
end
