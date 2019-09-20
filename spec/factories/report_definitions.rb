# == Schema Information
#
# Table name: report_definitions
#
#  id              :bigint           not null, primary key
#  name            :string
#  type            :string
#  period_type     :string
#  period_quantity :integer
#  text            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryBot.define do
  factory :report_definition do
    name { 'Report Definition' }
    type { 'Tipo' }
    period_type { 'Mensual' }
    period_quantity { 1 }
    text { 'Texto' }
  end
end
