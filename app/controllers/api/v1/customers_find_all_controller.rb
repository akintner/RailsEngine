class Api::V1::CustomersFindAllController < ApplicationController

  def index
    render json: Customer.all
  end
end