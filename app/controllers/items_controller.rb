class ItemsController < ApplicationController
  def new
    @form = Form::ItemCollection.new
  end

  def create
    @form = Form::ItemCollection.new(item_collection_params)
    if @form.save
      redirect_to root_path
    else
      flash.now[:alert] = "商品登録に失敗しました"
      render :new
    end

  end

  private

  def item_collection_params
    params.require(:form_item_collection)
    .permit(items_attributes: [:item_number, :color, :availability])
  end

end
