module CartHelper
  def current_cart
    if session[:cart_id].present?
      cart_in_session = Cart.find_by(id: session[:cart_id])
      if !cart_in_session.nil? && (cart_in_session.user_id.nil? || cart_in_session.user_id == current_user.id)
        @cart = cart_in_session
      else
        if current_user.present?
          @cart = current_user.create_cart
        else
          @cart = Cart.create
        end
        session[:cart_id] = @cart.id
      end
    else
      if current_user.present?
        @cart = current_user.create_cart
      else
        @cart = Cart.create
      end
      session[:cart_id] = @cart.id
    end
    @cart
  end

end
