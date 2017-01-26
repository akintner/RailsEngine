class Api::V1::ItemsMostController < ApplicationController
  def index
    quantity = params[:quantity]
    render json: Item.most_items(quantity)
  end
end