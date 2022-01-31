class ClientsController < ApplicationController
  before_action :authenticate_user!

  def new
    @form = Form::ClientCollection.new
  end

  def create
    @form = Form::ClientCollection.new(client_collection_params)
    unless @form.save
      render :new
    end
  end

  private

    def client_collection_params
        params.require(:form_client_collection)
        .permit(clients_attributes: [:name, :availability])
    end
end
