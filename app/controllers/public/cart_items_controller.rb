class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @total = 0
  end


  def update

  end
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to public_cart_items_path
  end

  def all_destroy
    cart_items = CartItem.all
    current_customer.cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save!
      redirect_to public_cart_items_path
    else
      @cart_items = CartItem.all
      flash[:danger] = "保存に失敗しました。"
      render :index
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
end
