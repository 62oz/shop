class CartController < ApplicationController


  def index
    @cart = helpers.current_cart
    @line_items = @cart.products
  end

  def show
    @cart = helpers.current_cart
    if !@cart.user_id.nil? && @cart.user_id != current_user.id
      #redirect home
      redirect_to root_path
    end
    @line_items = @cart.line_items
  end

  def empty
    @cart = helpers.current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to cart_path(@cart)
  end

end
