# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Internment, type: :model do
  context 'Do validation tests' do
    #subject { described_class.new(begin_date: "12/08/2019", type: "Voluntaria", end_date: "20/09/2019", patient_id: 1) }
    internment = FactoryBot.build(:internment)
    it 'Ensures begin date presence' do
      internment.begin_date = nil
      expect(internment.save).to eq(false)
    end
    it 'Ensures type of internment presence' do
      internment.type = nil
      expect(internment.save).to eq(false)
    end
    
  end
  context "Testing Patient relation" do
    it "Belongs to a Patient Test Nº1" do
      expect { FactoryBot.build(:internment).patient }.to_not raise_error
    end
    it "Belongs to Patient Test Nº2" do
      assc = Internment.reflect_on_association(:patient)
      expect(assc.macro).to eq :belongs_to
    end
    it "Belongs to Patient Test Nº3" do
      expect(Internment.reflect_on_association(:patient).macro).to eq :belongs_to
    end
  end
end
