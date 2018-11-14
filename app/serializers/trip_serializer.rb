class TripSerializer < ActiveModel::Serializer
  attributes :start_address, :destination_address, :price, :date
end