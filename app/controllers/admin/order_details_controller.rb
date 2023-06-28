class Admin::OrderDetailsController < ApplicationController
  def update
    @order = Order.find(params[:order_detail][:order_id])
    @order_detail = OrderDetail.find(params[:id])
    @order_details = @order.order_details.all
    #@order_detail = OrderDetail.find(params[:id])
    #@order = @order_detail.order
    #@order_detail.update(order_detail_params)


    is_updated = true
    @order_detail.update(order_detail_params)
      @order.update(status: 3) if @order_detail.production_status == "in_production"
      @order_details.each do |order_detail|
        if order_detail.production_status != "in_production_complete"
          is_updated = false
        end
      end
      @order.update(status: 4) if is_updated
    redirect_to admin_order_path(@order)
  end
  # def update
  #   order_item = OrderDetail.find(params[:order_detail][:order_id])
  #   order = order_item.order
  #   if params[:order_detial][:production_status] == "3"
  #     order.update(status: "3")
  #   end
  #   order_detail.update(production_status: params[:order_detail][:production_status])

  #   status = 0
  #   order = Order.find(params[:id])
  #   order.order_details.each do |order_detail|
  #     if order_detail.production_status !"4"
  #       status = 2
  #     end
  #   end
  #   if status == 0
  #     order.update(status: "4")
  #   end
  #   redirect_to admin_order_path
  # end
  # def update
  #   @order = Order.find(params[:id])
  #   @order_detail = OrderDetail.find(params[:id])
  #   @order_details = @order.order_details.all

  #   is_updated = true
  #   if @order_detail.update(order_detail_params)
  #     @order.update(status: 3) if @order_detail.production_status == "in_production"
  #     @order.details.each do |order_detail|
  #       if order_detail.production_status != "production_complete"
  #         is_updated = false
  #       end
  #     end
  #     @order.update(status: 4) if is_update

  #   end
  #   redirect_to admin_order_path(@order)
  # end

  private
  def order_detail_params
    params.require(:order_detail).permit(:production_status, :order_id)
  end
end