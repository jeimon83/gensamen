# frozen_string_literal: true

# Internment Controller
class InternmentsController < ApplicationController
  before_action :set_patient, only: [:index, :new, :create]
  before_action :set_internment, only: [:show, :update, :destroy]

  def index
    @internments = @patient.internments
    render json: @internments, status: :ok
  end

  def create
    @internment = @patient.internments.new(internment_params)
    if @internment.save
      render json: @internment, serializer: InternmentSerializer
    else
      render json: @internment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: @internment
  end

  def update
    if @internment.update(internment_params)
      render json: @internment, serializer: InternmentSerializer
    else
      render json: @internment.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def destroy
    @internment.destroy
    if @internment.destroyed?
      render json: {}, status: :no_content
    else
      render json: @internment.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def set_patient
     @patient = Patient.find(params[:patient_id])
  end

  def set_internment
     @internment = Internment.find(params[:id])
  end

  def internment_params
    params.require(:internment).permit(:begin_date, :type, :end_date) 
  end

end
