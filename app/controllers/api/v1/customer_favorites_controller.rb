class Api::V1::CustomersFavoritesController < ApplicationController
  def show
    render json: Customer.find(params[:id]).favorite_merchant
  end
end