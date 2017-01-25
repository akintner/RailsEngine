class Api::V1::Invoices::MerchantRelationshipController < ApplicationController
  def index
    render json: Invoice.find(params[:_id].to_i).merchant
  end
end