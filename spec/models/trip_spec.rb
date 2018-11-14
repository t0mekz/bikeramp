require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe "validations" do
    subject { build :trip}
    
    context "presence" do
      it { should validate_presence_of(:start_address) }
      it { should validate_presence_of(:destination_address) }
      it { should validate_presence_of(:price) }
      it { should validate_presence_of(:date) }
    end

    it { should validate_numericality_of(:price) }
  end
end
