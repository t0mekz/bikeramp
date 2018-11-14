require 'rails_helper'

RSpec.describe Api::V1::TripsController, type: :controller do
  describe "POST create" do
    let(:subject) { post :create, params: params }
    let(:params) { attributes_for(:trip) }

    # it { should route(:post, '/api/v1/trips').to(action: :create) }

    it "should permit proper attributes" do
      should permit(:start_address, :destination_address, :price, :date).
        for(:create, params: params)
    end

    context "when params are valid" do
      it "creates new trip" do
        expect { subject }.to change { Trip.count }.by(1)
      end

      it "returns with 201 Created" do
        subject
        expect(response).to have_http_status(:created)
      end

      it "render trip in response" do
        subject
        expect(JSON.parse(response.body).keys).to contain_exactly *params.stringify_keys.keys
      end
    end

    context "when params are not valid" do
      let(:params) { {} }

      it "not create new trip" do
        expect { subject }.to change { Trip.count }.by(0)
      end

      it "returns with 422 Unprocessable Entity" do
        subject
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "render errors" do
        subject
        expect(JSON.parse(response.body).keys).to contain_exactly "errors"
      end
    end
  end
end
