class Api::V1::Stats::WeeklyController < ApplicationController
  def index
    stats = WeeklyStatistic.current_week
    render json: stats, each_serializer: WeeklyStatisticSerializer
  end
end
