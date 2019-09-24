class ReportRequestJob < ApplicationJob
  queue_as :default

  def perform
    grab_open_internments
  end

  def grab_open_internments
    @internment = Internment.where(end_date: nil)
    first_open_internment if @internment
  end

  def first_open_internment
    @open_internment = @internment.first
    check_days
  end

  def check_days
    if Date.today == @open_internment.begin_date + 1.months - 10.days
      generate_report
    else
      next_open_internment
    end   
  end

  def generate_report
    @patient = Patient.find(@open_internment.patient_id)
    @report = ReportRequest.create(clinic_id: @patient.clinic_id, patient_id: @patient.id, requested_date: Date.today, type: 'Automático')
    next_open_internment
  end

  def next_open_internment
    @open_internment = @internment.where('id > ?', @open_internment.id).first
    check_days if @open_internment
  end
end
