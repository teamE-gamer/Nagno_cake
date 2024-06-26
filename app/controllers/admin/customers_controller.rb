class Admin::CustomersController < ApplicationController
  before_action :check_customer_existence, only: [:show, :edit, :update]


  def index
    @customers=Customer.page(params[:page])
  end

  def show
    @customer=Customer.find(params[:id])
  end

  def edit
    @customer=Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer), notice: "会員情報を更新しました。"
    else
      render :edit
    end
  end


  private

    def customer_params
      params.require(:customer).permit(:last_name,
                                       :first_name,
                                       :last_name_kana,
                                       :first_name_kana,
                                       :post_code,
                                       :address,
                                       :telephone_number,
                                       :email,
                                       :is_active
                                       )
    end



    def check_customer_existence
      @customer=Customer.find_by(id: params[:id])
      unless @customer
        redirect_to admin_customers_path
      end
    end


end
