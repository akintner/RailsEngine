class Api::V1::Merchants::FindAllController < ApplicationController

  def index
    render json: Merchant.where_by_params(params)
  end
end