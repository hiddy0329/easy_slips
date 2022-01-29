class ProductsController < ApplicationController

  def new
    @form = Form::ProductCollection.new
  end

  def create
    @form = Form::ProductCollection.new(product_collection_params)
    if @form.save
      redirect_to new_product_path
    else
      render :new
    end

  end

  private

    def product_collection_params
        params.require(:form_product_collection)
        .permit(products_attributes: [:item_number, :name, :color, :price, :note, :availability])
    end

end