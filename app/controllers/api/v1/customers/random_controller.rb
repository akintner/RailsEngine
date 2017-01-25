class Api::V1::Customers::RandomController < ApplicationController

  def show
    render json: Customer.take
  end
end