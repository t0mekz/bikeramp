class Trip < ApplicationRecord
  validates_presence_of :start_address, :destination_address, :price, :date
  validates :price, numericality: { greater_or_equal_to: 0 }
end
