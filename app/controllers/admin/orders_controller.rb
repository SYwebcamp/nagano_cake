class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end
  def update
    @order = Order.find(params[:id])
    @order.details = OrderDetail.where(order_id: params[:id])
    if @order.update(order_params)
      @order_details.update.all(production_status: 1) if @order.status == "payment_confirmation"
    end
    redirect_to  admin_order_path(@order)
  end
  def index
    @orders = Order.all
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end
