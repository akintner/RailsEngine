class Api::V1::RelationshipItemMerchantController < ApplicationController
  def index
    render json: Item.find(params[:item_id].to_i).merchant
  end
end