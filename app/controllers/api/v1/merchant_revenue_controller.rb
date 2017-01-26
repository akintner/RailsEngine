class Api::V1::MerchantRevenueController < ApplicationController
  def index
    date = params[:date]
    render json: Merchant.find(params[:merchant_id]).total_revenue(date), serializer: MerchantRevenueSerializer
  end
end