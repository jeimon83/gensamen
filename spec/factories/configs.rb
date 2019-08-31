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

FactoryBot.define do
  factory :config do
    checklist { '' }
  end
end
