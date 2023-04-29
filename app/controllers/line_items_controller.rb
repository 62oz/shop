class LineItemsController < ApplicationController

  def create
    @cart = helpers.current_cart
    @line_item = @cart.line_items.build(line_item_params)

    if @line_item.save
      redirect_to cart_path(@cart), notice: 'Item was successfully added to cart.'
    else
      redirect_to @product, alert: 'Error adding item to cart.'
    end
  end

  def destroy
    @cart = helpers.current_cart
    @line_item = @cart.line_items.where(id: params[:id]).take
    puts @line_item.inspect
    if @line_item
      @line_item.destroy
      redirect_to cart_path(@cart), notice: 'Item was successfully removed from cart.'
    end
  end

  private

  def line_item_params
    params.require(:line_item).permit(:product_id, :quantity)
  end


end
