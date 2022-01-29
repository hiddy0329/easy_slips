class ClientsController < ApplicationController
  def new
    @form = Form::ClientCollection.new
  end

  def create
    @form = Form::ClientCollection.new(client_collection_params)
    if @form.save
      redirect_to new_client_path
    else
      flash.now[:alert] = "商品登録に失敗しました"
      render :new
    end

  end

  private

    def client_collection_params
        params.require(:form_client_collection)
        .permit(clients_attributes: [:name, :availability])
    end
end
