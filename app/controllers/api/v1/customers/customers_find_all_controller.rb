class Api::V1::CustomersFindAllController < ApplicationController

  def index
    render json: Customer.find(:first_name) || render json: Customer.find(:last_name) 
  end
end