# frozen_string_literal: true

# Clinics Controller
class ClinicsController < ApplicationController
  before_action :set_clinic, only: [:show, :update, :destroy]

  def index
    service = Search::Clinic.new(current_user, params)
    service.run
    render json: service.data, each_serializer: ClinicSerializer, meta: service.metadata
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
      render json: @clinic, serializer: ClinicSerializer
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

  def contacts
    service = Search::Contact.new(current_user, params.merge(clinic_id: params[:id]))
    service.run
    render json: service.data, each_serializer: ContactSerializer, meta: service.metadata
  end

  def internments
    service = Search::Internment.new(current_user, params.merge(clinic_id: params[:id]))
    service.run
    render json: service.data, each_serializer: InternmentSerializer, meta: service.metadata
  end

  private

  def set_clinic
    @clinic = Clinic.find(params[:id])
    check_user
  end

  def check_user
    authorized = AuthorizeObject.call(current_user, @clinic).result
    render json: { error: 'Not Authorized' }, status: 401 unless authorized
  end

  def clinic_params
    params.require(:clinic).permit(:name, :cuit, :habilitation, :beds_voluntary, :beds_judicial) 
  end

end
