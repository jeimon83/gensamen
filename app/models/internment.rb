# == Schema Information
#
# Table name: internments
#
#  id         :bigint           not null, primary key
#  begin_date :date
#  type       :string
#  end_date   :date
#  patient_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Internment < ApplicationRecord
  self.inheritance_column = :_type_disabled
  validates_presence_of :begin_date, :type
  belongs_to :patient
end
