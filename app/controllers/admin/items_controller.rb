class Admin::ItemsController < ApplicationController

  def index
    @items=Item.all
  end

  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end

  def show
    @item=Item.find(params[:id])
    tax_cal = @item.price * 1.1
    @price_with_tax=tax_cal.floor
  end

  def edit
  end

  def update
  end



  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :status,:genre_id)
  end


end
