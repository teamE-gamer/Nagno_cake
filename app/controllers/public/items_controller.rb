class Public::ItemsController < ApplicationController
  before_action :check_item_existence, only: [:show]

  def index
    @items=Item.page(params[:page])

  end

  def show
    @item=Item.find(params[:id])
    tax_cal = @item.price * 1.1
    @price_with_tax=tax_cal.floor
    @cart_item=CartItem.new


  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :status,:genre_id)
  end


  def check_item_existence
    @item=Item.find_by(id: params[:id])
    unless @item
      redirect_to public_items_path
    end
  end



end
