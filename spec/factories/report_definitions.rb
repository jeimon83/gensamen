# == Schema Information
#
# Table name: report_definitions
#
#  id          :bigint           not null, primary key
#  name        :string
#  type        :string
#  periodicity :date
#  text        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :report_definition do
    name { "MyString" }
    type { "" }
    periodicity { "2019-09-19" }
    text { "MyText" }
  end
end
