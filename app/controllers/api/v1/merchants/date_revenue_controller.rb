class Api::V1::Merchants::DateRevenueController < ApplicationController
  def index
    render json: Merchant.total_revenue_by_date(params[:date])
  end
end