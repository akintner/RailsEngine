class Api::V1::Merchants::FindController < ApplicationController

  def index
    render json: Merchant.find_by_params(params)
  end
end