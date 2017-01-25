class Api::V1::Transactions::FindAllController < ApplicationController

  def index
    render json: Transaction.where_by_params(params)
  end
end