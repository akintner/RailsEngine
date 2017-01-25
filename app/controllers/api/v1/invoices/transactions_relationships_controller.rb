class Api::V1::Invoices::TransactionsRelationshipsController < ApplicationController
  def index
    render json: Invoice.find(params[:_id].to_i).transactions
  end
end