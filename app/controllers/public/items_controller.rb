class Public::ItemsController < ApplicationController

  def index
    @items=Item.page(params[:page])

  end

  def show
    @item=Item.find(params[:id])
    tax_cal = @item.price * 1.1
    @price_with_tax=tax_cal.floor
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :status,:genre_id)
  end


end
