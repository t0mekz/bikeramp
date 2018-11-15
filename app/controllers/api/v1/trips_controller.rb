module Api
  module V1
    class TripsController < ApplicationController
      def create
        @trip = Trip.new(permitted_params)
        if @trip.save
          @trip.calculate_distance
          render json: @trip, status: :created
        else
          render json: { errors: @trip.errors }, status: :unprocessable_entity
        end
      end

      private

      def permitted_params
        params.permit(:start_address, :destination_address, :price, :date)
      end
    end
  end
end
