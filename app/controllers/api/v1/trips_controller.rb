module Api
  module V1
    class TripsController < ApplicationController
      def create
        @trip = ::CreateTripService.call(permitted_params)
        if @trip.persisted?
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
