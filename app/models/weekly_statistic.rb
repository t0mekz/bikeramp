class WeeklyStatistic < ApplicationRecord
  scope :current_week, -> { find_by("week_start = ? AND week_end = ?", Date.today.beginning_of_week, Date.today.end_of_week) }

  class << self
    def refresh_view
      ActiveRecord::Base.connection.execute("REFRESH MATERIALIZED VIEW weekly_statistics")
    end
  end
end
