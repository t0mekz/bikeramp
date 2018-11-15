class WeeklyStatisticSerializer < BaseStatisticsSerializer
  attributes :total_distance, :total_price

  def total_price
    parse_currency(object.total_price)
  end
end
