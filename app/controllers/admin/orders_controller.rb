class Admin::OrdersController < ApplicationController
  before_action :check_order_existence, only: [:show, :update]

  def show
   @order_details = OrderDetail.where(order_id: params[:id])
   @order = Order.find(params[:id])
  end

  def update
     @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "注文ステータスを更新しました"
      redirect_to admin_order_path
    else
      flash[:alert] = "注文ステータスの更新に失敗しました"
      redirect_to admin_order_path
    end
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
