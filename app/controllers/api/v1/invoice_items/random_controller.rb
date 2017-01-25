class Api::V1::InvoiceItems::RandomController < ApplicationController
  def index
    render json: InvoiceItem.random
  end
end