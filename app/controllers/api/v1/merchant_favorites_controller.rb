class Api::V1::MerchantFavoritesController < ApplicationController
  def index
    render json: Merchant.find(params[:merchant_id]).favorite_customer
  end
end