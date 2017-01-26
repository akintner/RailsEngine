class Api::V1::RelationshipMerchantInvoicesController < ApplicationController
  def index
    render json: Merchant.find(params[:merchant_id]).invoices.order('id ASC')
  end
end