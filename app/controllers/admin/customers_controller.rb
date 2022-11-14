class Admin::CustomersController < ApplicationController

  def index
   @customer = Customer.new
   @customers = Customer.all
  end

  def show
   @customer = Customer.find(params[:id])
  end

  def edit
   @customer = Customer.find(params[:id])
  end

  def update
   @customer = Customer.find(params[:id])
   @customer.update(customer_params)
    redirect_to admin_customer_path
  end
end
