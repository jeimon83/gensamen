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
  attributes :id, :type, :begin_date, :end_date, :patient, :clinic
  belongs_to :patient

  def clinic
  	Clinic.find_by(id: self.object.patient.clinic_id)
  end

end
