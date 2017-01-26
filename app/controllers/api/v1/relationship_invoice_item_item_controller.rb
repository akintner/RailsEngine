class Api::V1::RelationshipInvoiceItemItemController < ApplicationController
   def index
    render json: InvoiceItem.find(params[:invoice_item_id].to_i).item
  end
end