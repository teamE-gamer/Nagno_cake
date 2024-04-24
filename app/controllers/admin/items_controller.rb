class Admin::ItemsController < ApplicationController
  before_action :check_item_existence, only: [:show, :edit, :update]

  def index
    @items=Item.page(params[:page])
  end

  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    if @item.save
      flash[:notice] = "商品が追加されました。"
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
    @item=Item.find(params[:id])
  end

  def update
    @item=Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item.id)
    else
      render :edit
    end
  end



  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :status,:genre_id)
  end



  def check_item_existence
    @item=Item.find_by(id: params[:id])
    unless @item
      redirect_to admin_items_path
    end
  end


end
