class Public::OrdersController < ApplicationController
  def new
    @addresses = Address.all
    @order = Order.new
  end

  def finish
  end

  def index
  end

  def show
  end
  def check
    @order = Order.new(order_params)
    binding.pry
  end
  def create
  end

  private
    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :name)
    end
end
