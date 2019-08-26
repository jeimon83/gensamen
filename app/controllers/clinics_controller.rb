# frozen_string_literal: true

# Clinics Controller
class ClinicsController < ApplicationController
  before_action :set_clinic, only: [:show, :update, :destroy]

  def index
    service = Search::Clinic.new(params)
    service.run
    clinics = service.data.map { |clinic| { id: clinic.id, name: clinic.name, cuit: clinic.cuit, habilitacion: clinic.habilitation,
                                            beds_voluntary: clinic.beds_voluntary, beds_voluntary: clinic.beds.beds_voluntary } }
    render json: { clinics: clinics, meta: service.metadata }
  end

  def create
    @clinic = Clinic.new(clinic_params)
    if @clinic.save
      render json: @clinic, serializer: ClinicSerializer
    else
      render json: @clinic.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: @clinic
  end

  def update
    if @clinic.update(clinic_params)
      render json: @clinic, serializer: clinicSerializer
    else
      render json: @clinic.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def destroy
    @clinic.destroy
    if @clinic.destroyed?
      render json: {}, status: :no_content
    else
      render json: @clinic.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def set_clinic
     @clinic = Clinic.find(params[:id])
  end

  def clinic_params
    params.require(:clinic).permit(:name, :cuit, :habilitation, :beds_voluntary, :beds_judicial) 
  end

end
