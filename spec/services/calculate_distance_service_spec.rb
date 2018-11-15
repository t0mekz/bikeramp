require 'rails_helper'
require 'google_distance_calculator_client'

RSpec.describe CalculateDistanceService do
  describe "#call" do
    subject { described_class.call(*params) }

    let(:distance_calculator) { GoogleDistanceCalculatorClient.new }
    let(:trip) { create :trip }
    let(:params) { [trip, distance_calculator] }

    it "should invoke external lib calculator" do
      expect(distance_calculator).to receive(:calculate_distance).with(trip.start_address, trip.destination_address)
      subject
    end

    it "should update trip record" do
      distance_calculator.stub(:calculate_distance).with(trip.start_address, trip.destination_address) { 5 }
      subject
      expect(trip.reload.distance).to eql 5
    end

    it "should invoke refreshing weekly view" do
      expect(WeeklyStatistic).to receive(:refresh_view)
      subject
    end
  end
end
