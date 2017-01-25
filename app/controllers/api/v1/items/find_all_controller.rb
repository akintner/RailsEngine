class Api::V1::Items::FindAllController < ApplicationController
  def index
    render json: Item.where_by_params(params)
  end
end