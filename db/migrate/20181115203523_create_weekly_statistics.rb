class CreateWeeklyStatistics < ActiveRecord::Migration[5.2]
  def change
    create_view :weekly_statistics, materialized: true
  end
end
