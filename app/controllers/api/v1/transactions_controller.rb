class Api::V1::TransactionssController < ApplicationController

  def index
    render json: Transaction.all
  end
end