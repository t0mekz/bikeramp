class StatsMonthlySerializer < ActiveModel::Serializer
  PRECISION = 2
  DISTANCE_DIVIDER = 1000

  attributes :day, :total_distance, :avg_ride, :avg_price

  def day
    object.date.strftime "%B, #{object.date.day.ordinalize}"
  end

  def total_distance
    "#{ (object.total_distance / DISTANCE_DIVIDER).round(PRECISION) } km"
  end

  def avg_ride
    "#{ (object.avg_ride / DISTANCE_DIVIDER).round(PRECISION) } km"
  end

  def avg_price
    "#{ object.avg_price.round(PRECISION) }PLN"
  end
end
