class Api::V1::InvoiceItems::FindAllController < ApplicationController
  def index
    render json: InvoiceItem.where_by_params(params)
  end
end