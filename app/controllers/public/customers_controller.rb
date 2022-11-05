class Public::CustomersController < ApplicationController
  before_action :correct_customer, only: [:edit, :update]
  def show
  end
  
  def delete
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer.id),notice: '会員情報を更新しました.'
    else
      render :edit
    end

  end
end
