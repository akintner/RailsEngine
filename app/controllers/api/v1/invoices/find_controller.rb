class Api::V1::Invoices::FindController < ApplicationController
  def index
    render json: Invoice.find_by_params(params)
  end
end