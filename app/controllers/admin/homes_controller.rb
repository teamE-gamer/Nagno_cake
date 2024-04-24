class Admin::HomesController < ApplicationController

  def top
  @orders = Order.includes(:customer)
  end
end
