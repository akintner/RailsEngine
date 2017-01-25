class Api::V1::Customers::FindAllController < ApplicationController

  def index
    render json: Customer.where_by_params(params) 
  end
end