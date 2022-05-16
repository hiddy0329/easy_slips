class ProductsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @products = Product.all.order('created_at DESC')
  end

  def new
    @form = Form::ProductCollection.new
  end

  def create
    @form = Form::ProductCollection.new(product_collection_params)
    if @form.save
      redirect_to products_path
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private

    def product_collection_params
        params.require(:form_product_collection)
        .permit(products_attributes: [:item_number, :color, :note, :availability])
    end

end