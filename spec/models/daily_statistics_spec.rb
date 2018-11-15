require 'rails_helper'

RSpec.describe DailyStatistics, type: :model do
  context "scopes" do
    describe "current_month" do
      let!(:today_trip) { create :trip, date: Date.today, distance: 40.1 }
      let!(:prev_month_trip) { create :trip, date: Date.today - 40.days, distance: 11.0 }

      subject { described_class.current_month }

      it "should contain only this month statistics" do
        expect(subject.size).to eq 1
      end

      it "should contain today statistics" do
        result = subject.first
        expect(result.date).to eq(today_trip.date)
        expect(result.total_distance).to eq(today_trip.distance)
        expect(result.avg_ride).to eq(today_trip.distance)
        expect(result.avg_price).to eq(today_trip.price)
      end
    end
  end
end
