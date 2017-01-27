class DateRevenueSerializer < ActiveModel::Serializer
  include ModelHelpers

  attributes :total_revenue

  def total_revenue
    penny_to_dollar(object.values.first).to_s
  end
end