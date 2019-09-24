class ReportRequestJob < ApplicationJob
  queue_as :default

  def perform
    grab_open_internments
  end

  def grab_open_internments
    open_internments = Internment.where(end_date: nil)
    first_open_internment
  end

  def first_open_internment
    open_internment = open_internments.first
    check_days
  end

  def check_days
    if Date.today == open_internment.begin_date + 1.months - 10.days
      generate_report
    else
      next_open_internment
    end   
  end

  def generate_report
    @patient = Patient.find(open_internment.patient_id)
    ReportRequest.create(clinic_id: @patient.clinic_id, patient_id: @patient.id, requested_date: Date.today, type: 'Automático')
  end

  def next_open_internment
    open_internment = open_internments.where('id > ?', open_internment.id).first
    check_days if open_internment
  end
end
