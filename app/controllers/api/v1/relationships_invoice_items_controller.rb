class Api::V1::RelationshipsInvoiceItemsController < ApplicationController
  def index
    render json: Invoice.find(params[:invoice_id].to_i).items
  end
end