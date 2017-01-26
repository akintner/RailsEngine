class Api::V1::CustomerFavoritesController < ApplicationController
  def index
    render json: Customer.find(params[:customer_id]).favorite_merchant
  end
end