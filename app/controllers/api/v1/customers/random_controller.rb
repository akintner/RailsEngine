class Api::V1::Customers::RandomController < ApplicationController
  def index
    render json: Customer.random
  end
end