class Api::V1::CustomersFindController < ApplicationController

  def show
    render json: Customer.find(params[:id])
  end
end