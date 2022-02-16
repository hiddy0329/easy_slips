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

    # 少なくとも1枚はページがないと破損したPDF扱いになるので適当に作っておく
    report.start_new_page

    report.page.item(:world).value(@slip.address_name)

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
