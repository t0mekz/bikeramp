class CreateTripService
  extend Callable

  attr_accessor :params

  def initialize(params)
    self.params = params
  end

  def call
    trip = Trip.create(params)
    trip.calculate_distance
    trip
  end
end
