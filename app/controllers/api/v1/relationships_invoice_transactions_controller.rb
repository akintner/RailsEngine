class Api::V1::RelationshipsInvoiceTransactionsController < ApplicationController
  def index
    render json: Invoice.find(params[:invoice_id].to_i).transactions
  end
end