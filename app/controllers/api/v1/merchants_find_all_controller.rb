class Api::V1::MerchantsFindAllController < ApplicationController

  def index
    render json: Merchant.all
  end
end