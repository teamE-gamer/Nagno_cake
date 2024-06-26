class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  before_action :check_address_existence, only: [:edit, :update, :destroy]

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "successfully."
      redirect_to public_addresses_path
    else
      @addresses = Address.all
      render :index
    end
  end

  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to public_addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:post_code, :address, :name)
  end

  def check_address_existence
    @address=Address.find_by(id: params[:id])
    unless @address
      redirect_to public_addresses_path
    end
  end


end