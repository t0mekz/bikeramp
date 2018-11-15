class BaseStatisticsSerializer < ActiveModel::Serializer
  PRECISION = 2

  def total_distance
    parse_distance(object.total_distance)
  end

  private

  def parse_currency(price)
    "#{ price.to_f.round(PRECISION) }PLN"
  end

  def parse_distance(distance)
    "#{ (distance.to_f).round(PRECISION) } km"
  end
end
