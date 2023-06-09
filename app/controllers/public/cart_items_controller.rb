class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @condition = @cart_items.blank?
    @total = 0
  end


  def update
    @cart_item = CartItem.find(params[:cart_item][:cart_item_id])
    @cart_item.update(amount: params[:cart_item][:amount])
    redirect_to cart_items_path
  end
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def all_destroy
    @cart_items = CartItem.all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      @cart_item.amount += params[:cart_item][:amount].to_i
      @cart_item.save
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.save
    end
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
end
