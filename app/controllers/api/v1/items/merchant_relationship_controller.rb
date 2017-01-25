class Api::V1::Items::MerchantRelationshipController < ApplicationController
  def index
    render json: Item.find(params[:_id].to_i).merchant
  end
end