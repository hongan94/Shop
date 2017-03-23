class ProductsController < ApplicationController
	layout 'auth'

	def show
		@product = Product.find(params[:id])
	end
end
