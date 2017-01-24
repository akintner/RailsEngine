class CustomersfindController < ApplicationController

  def show
    render json: Customer.find_by_param(input)
  end
end