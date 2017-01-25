class Api::V1::RelationshipsItemInvoiceItemsController < ApplicationController
  def index
    render json: Item.find(params[:item_id].to_i).invoice_items
  end
end