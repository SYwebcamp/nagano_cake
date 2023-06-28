class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = current_customer.addresses.all
  end

  def edit
    @address = Address.find(params[:id])
  end
  def create
    @address = Address.new(address_params)
    if @address.save
      flash[:succsess] = "配送先を登録しました。"
      redirect_to addresses_path
    else
      flash[:danger] = "配送先の登録に失敗しました。"
      @addresses = current_customer.addresses.all
      render :index
    end
  end
  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path
    else
      flash[:danger] = "変更に失敗しました。"
      render :edit
    end
  end
  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :name, :address, :customer_id)
  end
end
