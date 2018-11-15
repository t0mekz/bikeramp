class Api::V1::Stats::MonthlyController < ApplicationController
  def index
    stats = DailyStatistics.current_month
    render json: stats, each_serializer: StatsMonthlySerializer
  end
end
