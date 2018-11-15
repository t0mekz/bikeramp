class WeeklyStatisticSerializer < ActiveModel::Serializer
  PRECISION = 2

  attributes :total_distance, :total_price

  def total_distance
    "#{ (object.total_distance.to_f).round(PRECISION) } km"
  end

  def total_price
    "#{ object.total_price.to_f.round(PRECISION) }PLN"
  end
end
