class Public::OrdersController < ApplicationController


  def new
    @order = Order.new
    @addresses = Address.all
  end

  def confirm
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.oders.new(order_params)
    if @order.save
      cart_items.each do |cart|
        order_item = Order.new
        order_item.item_id = cart.item.item.id
        order_item.order_id = @order.id
        order_item.order_number = cart.item.total_price
        order_item.order_quantity = cart.quantity
        order_item.order_price = cart.item.price
        order_item.save
      end
      redirect_to complete_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def index
    @orders = current_customer
    
  end

  def show
    
  end

  def complete
  end


private

def order_params
  params.require(:order).permit(:name, :address, :total_payment, :post_code, :shipping_cost, :payment_method, :status, :customer_id)
end


end
