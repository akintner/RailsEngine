class Api::V1::Transactions::FindController < ApplicationController

  def index
    render json: Transaction.find_by_params(params)
  end
end