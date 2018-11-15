class Api::V1::Stats::MonthlyController < ApplicationController
  def index
    stats = MonthlyStatsQuery.new(Trip.all)
    render json: stats, each_serializer: StatsMonthlySerializer
  end
end
