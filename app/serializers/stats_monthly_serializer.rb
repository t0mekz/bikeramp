class StatsMonthlySerializer < BaseStatisticsSerializer
  attributes :day, :total_distance, :avg_ride, :avg_price

  def day
    object.date.strftime "%B, #{object.date.day.ordinalize}"
  end

  def avg_ride
    parse_distance(object.avg_ride)
  end

  def avg_price
    parse_currency(object.avg_price)
  end
end
