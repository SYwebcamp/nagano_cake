class Public::OrdersController < ApplicationController
  def new
    @addresses = current_customer.addresses.all
    @order = Order.new
    @address_new = Address.new
  end

  def finish
  end


  def check
    @addresses = current_customer.addresses.all
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.shipping_name = current_customer.first_name + current_customer.last_name
      @order.shipping_address = current_customer.address
      @order.shipping_postal_code = current_customer.postal_code
    elsif params[:order][:select_address] == "1"
      @address_new = current_customer.addresses.new(address_params)
      if Address.exists?(id: params[:order][:address_id])
        @order.shipping_name = Address.find(params[:order][:address_id]).name
        @order.shipping_address = Address.find(params[:order][:address_id]).address
        @order.shipping_postal_code = Address.find(params[:order][:address_id]).postal_code
      else
        flash[:notice] = "エラーが発生しました"
        render :new
      end
    elsif params[:order][:select_address] == "2"
      @address_new = current_customer.addresses.new(address_params)
      if @address_new.save
        @order.shipping_name = @address_new.name
        @order.shipping_postal_code = @address_new.postal_code
        @order.shipping_address = @address_new.address
      else
        render :new
      end
    end
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |total, cart_item| total + cart_item.subtotal }
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.product_id = cart.item.id
        order_detail.order_id = @order.id
        order_detail.product_quantity = cart.amount
        order_detail.tax_included = cart.item.add_tax_price
        order_detail.save
      end
      redirect_to  finish_orders_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def index
    @cart_items = CartItem.all
    @orders = current_customer.orders.all
    @order_details = OrderDetail.all
  end

  def show
    @order_detail = OrderDetail.find(params[:id])
    @order = Order.find(params[:id])
    @order_details = OrderDetail.all
  end

  private
    def order_params
      params.require(:order).permit(:customer_id, :payment_method, :shipping_postal_code, :shipping_address, :shipping_name, :amount_paid, :postage)
    end
    def address_params
      params.require(:order).permit(:address, :name, :postal_code)
    end
end
