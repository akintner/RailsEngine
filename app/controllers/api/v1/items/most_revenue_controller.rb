class Api::V1::Items::MostRevenueController < ApplicationController
  def index
    quantity = params[:quantity]
    render json: Item.most_revenue(quantity)
  end
end