class Api::V1::Customers::FindController < ApplicationController

  def index
    render json: Customer.find_by_params(params)
  end
end