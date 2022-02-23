class ClientsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @clients = Client.all.order('created_at DESC')
  end

  def new
    @form = Form::ClientCollection.new
  end

  def create
    @form = Form::ClientCollection.new(client_collection_params)
    if @form.save
      redirect_to clients_path
    else
      render :new
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to clients_path
  end

  private

    def client_collection_params
        params.require(:form_client_collection)
        .permit(clients_attributes: [:name, :availability])
    end
end
