class SlipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_slip, only: [:show, :edit, :update, :destroy, :output]

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

  def show
  end

  def edit
  end

  def update
    if @slip.update(slip_params)
      redirect_to slip_path(@slip.id)
    else
      render :edit
    end
  end

  def destroy
    @slip.destroy
    redirect_to slips_path
  end

  def output
    report = Thinreports::Report.new(layout: "#{Rails.root}/app/pdfs/easy_slips.tlf")

    report.start_new_page

    report.page.item(:address_name).value(@slip.address_name)
    report.page.item(:company).value(current_user.name)
    report.page.item(:shipping_date).value(@slip.shipping_date)
    report.page.item(:slip_number).value(@slip.slip_number)
    report.page.item(:invoice_number).value(@slip.invoice_number)

    total = 0 
    @slip.orders.each do |order| 
      report.list.add_row do |row| 
        row.item(:order_number).value(order.order_number)
        row.item(:color).value(order.color)
        row.item(:count).value(order.count)
        row.item(:note).value(order.note)
      end
      if order.count.present? 
        total += order.count 
      end
    end
    report.page.item(:total).value(total) 
  
    file = report.generate

    send_data(
      file,
      filename: "easy_slips.pdf",
      type: "application/pdf",
      disposition: "inline")
  end

  private

  def slip_params
    params.require(:slip).permit(:address_name, :shipping_date, :slip_number, :invoice_number, orders_attributes: [:order_number, :color, :count, :note, :_destroy, :id])
  end

  def set_slip
    @slip = Slip.find(params[:id])
  end
end
