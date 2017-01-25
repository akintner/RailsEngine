class Api::V1::CustomersController < ApplicationController

  def index
    render json: Customer.all
  end

  def show
    render json: Customer.find(params[:id])
  end

  private
    def customer_params
      params.permit(:first_name, :last_name)
    end
end