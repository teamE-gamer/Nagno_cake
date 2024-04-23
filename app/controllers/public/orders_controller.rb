class Public::OrdersController < ApplicationController


  def new
    @order = Order.new
    @addresses = current_customer.addresses
    
  end

  def confirm
       @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
       @address = Address.find(params[:order][:address_id])
       @order.post_code = @address.post_code
       @order.address = @address.address
       @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      @order.customer_id = current_customer.id
    end
      @cart_items = current_customer.cart_items
      @order_new = Order.new
      render :confirm
    
  end

  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.shipping_cost = 800
    order.save
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = order.id
      @order_details.item_id = cart_item.item.id
      @order_details.price = cart_item.item.price
      @order_details.amount = cart_item.amount
      @order_details.making_status = 0
      @order_details.save!
    end
    
    CartItem.destroy_all
    redirect_to public_complete_path

  end

  def index
    @orders = current_customer.orders
    
  end

  def show
    if params[:id] == "confirm"
    redirect_to new_public_order_path
    else
    @order = Order.find(params[:id])
    end
  end


  def complete
  end


private

def order_params
  params.require(:order).permit(:name, :address, :total_payment, :post_code, :shipping_cost, :payment_method, :status, :customer_id, )
end


def cartitem_nill
     cart_items = current_customer.cart_items
     if cart_items.blank?
      
      redirect_to public_complete_path
     end
end
end