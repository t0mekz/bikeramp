class MonthlyStatsQuery
  attr_accessor :relation, :start_date, :end_date

  def initialize(relation, start_date = nil, end_date = nil)
    self.relation = relation
    self.start_date = start_date || Date.current.beginning_of_month.to_s
    self.end_date = end_date || Date.current.end_of_month.to_s
  end

  def call
    relation
     .select('date as date, SUM(distance) as total_distance, AVG(distance) as avg_ride, AVG(price) as avg_price')
     .where("distance IS NOT null AND date BETWEEN date ? AND date ?", start_date, end_date)
     .group(:date)
  end
end
