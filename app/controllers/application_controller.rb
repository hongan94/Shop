class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart

  private
    def after_sign_out_path_for(resource)
        root_path
    end

    def set_cart
      @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
end
