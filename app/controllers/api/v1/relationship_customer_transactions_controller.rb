class Api::V1::RelationshipCustomerTransactionsController < ApplicationController
  def index
    render json: Customer.find(params[:customer_id]).transactions
  end
end