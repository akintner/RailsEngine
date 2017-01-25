class Api::V1::Invoices::InvoiceItemsRelationshipsController < ApplicationController
  def index
    render json: Invoice.find(params[:_id].to_i).invoice_items
  end
end