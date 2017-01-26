class Api::V1::Merchants::TopRevenueController < ApplicationController
  def index
    render json: Merchant.top_x_by_revenue(params[:quantity])#, serializer: MerchantTopRevenueSerializer
  end
end