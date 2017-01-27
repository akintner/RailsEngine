class Api::V1::Items::MostItemsController < ApplicationController
  def index
    quantity = params[:quantity]
    render json: Item.most_items(quantity)
  end
end