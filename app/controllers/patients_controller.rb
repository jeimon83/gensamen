# frozen_string_literal: true

# Patients Controller
class PatientsController < ApplicationController
  before_action :set_clinic, only: [:index, :new, :create]
  before_action :set_patient, only: [:show, :update, :destroy]

  def index
    service = Search::Patient.new(current_user, params)
    service.run
    patients = service.data.map { |p| { id: p.id, firstname: p.firstname, lastname: p.lastname, document_type: p.document_type, 
                                        document_number: p.document_number, birth_date: p.birth_date, medical_record: p.medical_record, clinic_id: p.clinic_id } }
    render json: { patients: patients, meta: service.metadata }
  end

  def create
    @patient = @clinic.patients.new(patient_params)
    if @patient.save
      render json: @patient, serializer: PatientSerializer
    else
      render json: @patient.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: @patient
  end

  def update
    if @patient.update(patient_params)
      render json: @patient, serializer: patientSerializer
    else
      render json: @patient.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @patient.destroy
    if @patient.destroyed?
      render json: {}, status: :no_content
    else
      render json: @patient.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def set_clinic
    @clinic = Clinic.find(params[:clinic_id])
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:lastname, :firstname, :document_type, :document_number, :gender, :birth_date,
                                    :address, :department, :state, :city, :postal_code, :medical_record, :clinic)
  end
end
