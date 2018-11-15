require 'rails_helper'

RSpec.describe CreateTripService do
  describe "#call" do
    subject { described_class.call(params) }

    let(:params) { attributes_for(:trip) }

    context "when params are valid" do
      it "should create new trip record" do
        expect { subject }.to change { Trip.count }.by(1)
      end
    end

    context "when params are invalid" do
      let(:params) { }

      it "shouldn't create trip record" do
        expect { subject }.to change { Trip.count }.by(0)
      end
    end

    it "should invoke distance calculation" do
      expect_any_instance_of(Trip).to receive(:calculate_distance)
      subject
    end

    it "should return trip object" do
      expect(subject).to be_a Trip
    end

  end
end
