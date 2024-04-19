class Public::AddressesController < ApplicationController

  def create
    @address = Address.new(address_params)
    @address.customer.id = current_customer.id
    if @address.save
      redirect_to public_addresses_path
    else
      @addresses = Address.all
      render :index
    end
  end

  def index
    @addresses = Address.all
  end

  def edit
    @address = Address.find(parans[id])
  end

  def update
    @address.update(address_params)
    redirect_to public_addresses_path
  end

  def destroy
    @address.destroy
    redirect_to public_addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:post_code, :address, :name)
  end

end
