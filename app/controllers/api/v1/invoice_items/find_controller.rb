class Api::V1::InvoiceItems::FindController < ApplicationController
  def index
    render json: InvoiceItem.find_by_params(params)
  end
end