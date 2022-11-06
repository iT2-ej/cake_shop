class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def delete
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(edit_update_path)
      redirect_to edit_information_path(@customer.id),notice: '会員情報を更新しました.'
    else
      render :edit
    end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end

  end
end
