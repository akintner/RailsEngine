class Api::V1::Transactions::RandomController < ApplicationController
  def index
    render json: Transaction.random
  end
end