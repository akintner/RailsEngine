class Api::V1::MerchantRevenueController < ApplicationController
  def index
    render json: Merchant.find(params[:merchant_id]).total_revenue
  end

  def show
    date = params[:date]
    ender json: Merchant.find(params[:merchant_id]).total_revenue_by_date(date)
  end
end