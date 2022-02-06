class SlipsController < ApplicationController
  before_action :authenticate_user!

  def new
    @slip = Slip.new
    10.times do
      @order = @slip.orders.new
    end
  end

  def create
    binding.pry
    @slip = Slip.new(slip_params)
    if @slip.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def slip_params
    params.require(:slip).permit(:address_name, :shipping_date, :slip_number, :invoice_number, orders_attributes: [:order_number, :color, :count, :note, :_destroy, :id])
  end
end
