class Api::V1::RelationshipInvoiceMerchantController < ApplicationController
  def index
    render json: Invoice.find(params[:invoice_id].to_i).merchant
  end
end