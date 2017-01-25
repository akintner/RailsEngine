class Api::V1::RelationshipInvoiceCustomerController < ApplicationController
  def index
    render json: Invoice.find(params[:invoice_id].to_i).customer
  end
end