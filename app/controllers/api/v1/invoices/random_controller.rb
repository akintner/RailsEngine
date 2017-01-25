class Api::V1::Invoices::RandomController < ApplicationController
  def index
    render json: Invoice.random
  end
end