class Trip < ApplicationRecord
  validates_presence_of :start_address, :destination_address, :price, :date
  validates :price, numericality: { greater_or_equal_to: 0 }

  def calculate_distance
    return if self.new_record?
    CalculateDistanceService.async_call(self)
  end
end
