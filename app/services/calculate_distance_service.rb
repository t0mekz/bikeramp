require "google_distance_calculator_client"

class CalculateDistanceService
  extend Callable

  attr_accessor :trip, :distanceCalculator

  def initialize(trip, distanceCalculator = GoogleDistanceCalculatorClient.new)
    self.trip = trip
    self.distanceCalculator = distanceCalculator
  end

  def call
    distance = distanceCalculator.calculate_distance(trip.start_address, trip.destination_address)
    trip.update(distance: distance)
    WeeklyStatistic.refresh_view
  end
end
