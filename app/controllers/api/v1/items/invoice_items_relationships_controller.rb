class Api::V1::Items::InvoiceItemsRelationshipsController < ApplicationController
  def index
    render json: Item.find(params[:_id].to_i).invoice_items
  end
end