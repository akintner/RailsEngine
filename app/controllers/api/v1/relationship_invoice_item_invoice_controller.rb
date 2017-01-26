class Api::V1::RelationshipInvoiceItemInvoiceController < ApplicationController
   def index
    render json: InvoiceItem.find(params[:invoice_item_id].to_i).invoice
  end
end