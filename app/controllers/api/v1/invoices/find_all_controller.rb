class Api::V1::Invoices::FindAllController < ApplicationController
  def index
    render json: Invoice.where_by_params(params)
  end
end