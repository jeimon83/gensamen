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
  attributes :id, :formatted_begin_date, :type, :formatted_end_date
  belongs_to :patient

  def formatted_begin_date
    self.object.begin_date.try(:strftime, "%d/%m/%Y")
  end

  def formatted_end_date
    self.object.end_date.try(:strftime, "%d/%m/%Y")
  end

end
