class Api::V1::Merchants::FindAllController < ApplicationController

  def index
    render json: Merchant.find_by_params(params)
  end
end