class Admin::OrdersController < ApplicationController
  before_action :check_order_existence, only: [:show, :update]

  def show
   @order = Order.find(params[:id])
   @order_details = @order.order_details
  end

  def update
     @order = Order.find(params[:id])
     @order_details = @order.order_details
     @order.update(status: params[:order][:status])
    if @order.status == "入金確認"
       @order_details.update_all(making_status: "製作待ち")
    end
       redirect_to admin_order_path(@order)
  end

private

  def order_params

    params.require(:order).permit(:status)

  end


  def check_order_existence
    @order=Order.find_by(id: params[:id])
    unless @order
      redirect_to admin_path
    end
  end


end
