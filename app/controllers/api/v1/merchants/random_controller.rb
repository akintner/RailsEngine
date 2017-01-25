class Api::V1::Merchants::RandomController < ApplicationController
  def index
    render json: Merchant.random
  end
end