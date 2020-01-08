# frozen_string_literal: true

# Internment Controller
class InternmentsController < ApplicationController
  before_action :set_patient, only: [:index, :new, :create]
  before_action :set_internment, only: [:show, :update, :destroy, :help_requests, :report_requests, :generate_pdf, :close]

  def index
    service = Search::Internment.new(current_user, params)
    service.run
    render json: service.data, each_serializer: InternmentSerializer, meta: service.metadata
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

  def generate_pdf    
    pdf = InternmentPdf::Generator.new(internment: @internment)
    pdf.generate
    send_data pdf.render, 
    filename: "internment_data_#{@internment.created_at.strftime("%d-%m-%Y")}.pdf",
    type: 'application/pdf', disposition: 'inline'
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

  def report_requests
    @report_request = @internment.report_requests
    render json: @report_request
  end

  def help_requests
    @help_request = HelpRequest.where(internment_id: @internment)
    render json: @help_request
  end

  def close
    if @internment.update(end_date: Time.now)
      render json: @internment
    else
      render json: @internment.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def set_patient
     @patient = Patient.find(params[:patient_id])
     check_user_authorization(@patient)
  end

  def set_internment
     @internment = Internment.find(params[:id])
     check_user_authorization(@internment)
  end

  def internment_params
    params.require(:internment).permit(:begin_date, :type, :end_date) 
  end
end
