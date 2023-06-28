class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def check

  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      flash[:success] = "会員情報を変更しました。"
      redirect_to customers_mypage_path
    else
      flash[:danger] = "変更に失敗しました。"
      render :edit
    end
  end
  def withdrawl
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_deleted)
  end
end
