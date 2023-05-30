class Admin::OrderDetailsController < ApplicationController
  def update
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
    @order_details = @order.order_details.all

    is_updated = true
    if @order_detail.update(order_detail_params)
      @order.update(status: 3) if @order_detail.production_status == "in_production"

      @order.details.each do |order_detail|
        if order_detail.production_status != "production_complete"
          is_updated = false
        end
      end
      @order.update(status: 4) if is_update

    end
    redirect_to admin_order_path(@order)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end