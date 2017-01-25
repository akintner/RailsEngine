class Api::V1::Invoices::ItemsRelationshipsController < ApplicationController
  def index
    render json: Invoice.find(params[:_id].to_i).items
  end
end