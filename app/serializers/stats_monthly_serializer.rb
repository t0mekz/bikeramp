class StatsMonthlySerializer < ActiveModel::Serializer
  PRECISION = 2
  DISTANCE_DIVIDER = 1000

  attributes :day, :total_distance, :avg_ride, :avg_price

  def day
    object.date.strftime "%B, #{object.date.day.ordinalize}"
  end

  def total_distance
    "#{ (object.total_distance.to_f / DISTANCE_DIVIDER).round(PRECISION) } km"
  end

  def avg_ride
    "#{ (object.avg_ride.to_f / DISTANCE_DIVIDER).round(PRECISION) } km"
  end

  def avg_price
    "#{ object.avg_price.to_f.round(PRECISION) }PLN"
  end
end
