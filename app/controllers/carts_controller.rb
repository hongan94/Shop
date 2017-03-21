layout :false
def add
	@product = Product.find(params[:id])
	@quantity = params[:quantity].to_i
	@cart.add(@product, @product.price, @quantity)
	redirect_to homes_path
end

def update
	@item = CartItem.find(params[:id])
	if params[:quantity].to_i.zero?
		@item.destroy
	else
		@item.update_quantity(params[:quantity])
	end
	redirect_to cart_path(session[:cart_id]), notice: 'You was update successfully!'
end

def destroy
	if params[:id].present?
		@item = CartItem.find(params[:id])
		@item.destroy
	else
		@item  = CartItem.where(owner_id: session[:cart_id])
		@item.destroy_all
	end
	flash[:notice] = "You has remove item successfully!"
	redirect_to cart_path(session[:cart_id])
end

def show
	@item  = CartItem.where(owner_id: session[:cart_id]).order(id: :desc)
end