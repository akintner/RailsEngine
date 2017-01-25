class Api::V1::RelationshipsInvoiceInvoiceItemsController < ApplicationController
  def index
    render json: Invoice.find(params[:invoice_id].to_i).invoice_items
  end
end