class Api::V1::Invoices::CustomerRelationshipController < ApplicationController
  def index
    render json: Invoice.find(params[:_id].to_i).customer
  end
end