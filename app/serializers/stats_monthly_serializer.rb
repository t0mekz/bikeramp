class StatsMonthlySerializer < ActiveModel::Serializer
  attributes :day, :total_distance, :avg_ride, :avg_price

  def day
    object.date.strftime '%B, #{object.date.day.ordinalize}'
  end

  def total_distance
    "#{object.total_distance / 1000} km"
  end

  def avg_ride
    "#{object.avg_ride / 1000} km"
  end

  def avg_price
    "#{object.avg_price / 100}PLN"
  end
end
