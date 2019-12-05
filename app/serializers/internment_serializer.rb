# frozen_string_literal: true

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
class InternmentSerializer < ActiveModel::Serializer
  attributes :id, :type, :end_date, :begin_date, :clinic_id
  belongs_to :patient
end
