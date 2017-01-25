class Api::V1::Items::FindController < ApplicationController
  def index
    render json: Item.find_by_params(params)
  end
end