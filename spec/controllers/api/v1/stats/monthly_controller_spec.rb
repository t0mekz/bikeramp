require 'rails_helper'

RSpec.describe Api::V1::Stats::MonthlyController, type: :controller do
  describe "GET index" do
    let(:subject) { get :index }

    it "should return array of results" do
      subject

      expect(JSON.parse(response.body)).to be_a Array
    end
  end
end
