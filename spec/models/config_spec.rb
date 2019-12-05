# frozen_string_literal: true

# == Schema Information
#
# Table name: configs
#
#  id         :bigint           not null, primary key
#  checklist  :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Config, type: :model do
  context 'Do validation tests' do
    let!(:config) { build(:config) }
    it 'Saves successfully' do
      expect(config.save).to eq(true)
    end
  end
end
