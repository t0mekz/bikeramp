class DailyStatistics < ActiveRecord::Base
  self.primary_key = "date"

  scope :current_month, -> { where("date BETWEEN ? AND ?", Date.today.beginning_of_month, Date.today.end_of_month) }
end
