class CreateDailyStatistics < ActiveRecord::Migration[5.2]
  def change
    create_view :daily_statistics
  end
end
