class Api::V1::ItemBestDayController < ApplicationController
  def index
    render json: Item.find(params[:item_id]).best_day, serializer: ItemBestDaySerializer
  end
end