class Api::V1::MerchantsItemsBusinessController < ApplicationController
  def index
    quantity = params[:quantity]
    render json: Merchant.most_items_sold(quantity)
  end
end