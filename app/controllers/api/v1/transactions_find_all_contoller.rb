class Api::V1::TransactionsFindAllController < ApplicationController

  def index
    render json: Transaction.all
  end
end