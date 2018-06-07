class OrdersController < ApplicationController
skip_after_action :verify_policy_scoped, :verify_authorized
  def show
    @order = current_user.orders.paid.find(params[:id])
  end

  def new
    @order = Order.new

  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    if @order.save
      redirect_to new_order_payment_path(@order)
    else
      render :new
    end
  end


  private

  def order_params
    params.require(:order).permit(:amount)
  end


end
