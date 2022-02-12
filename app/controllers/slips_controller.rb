class SlipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @slips = Slip.all.order('created_at DESC')
  end

  def new
    @slip = Slip.new
    10.times do
      @order = @slip.orders.new
    end
  end

  def create
    @slip = Slip.new(slip_params)
    unless @slip.save
      render :new
    end
  end

  private

  def slip_params
    params.require(:slip).permit(:address_name, :shipping_date, :slip_number, :invoice_number, orders_attributes: [:order_number, :color, :count, :note, :_destroy, :id])
  end
end
