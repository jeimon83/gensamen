# frozen_string_literal: true

# Report Request Controller
class ReportRequestsController < ApplicationController
  before_action :set_clinic, only: [:index, :new, :create]
  before_action :set_report_request, only: [:show, :update, :destroy]

  def index
    @report_requests = @clinic.report_requests
    render json: @report_requests, each_serializer: ReportRequestSerializer
  end

  def create
    @report_request = @clinic.report_requests.new(report_request_params)
    if @report_request.save
      render json: @report_request, serializer: ReportRequestSerializer
    else
      render json: @report_request.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: @report_request, serializer: ReportRequestSerializer
  end

  def update
    if @report_request.update(report_request_params)
      render json: @report_request, serializer: ReportRequestSerializer
    else
      render json: @report_request.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @report_request.destroy
    if @report_request.destroyed?
      render json: {}, status: :no_content
    else
      render json: @report_request.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def set_clinic
    @clinic = Clinic.find(params[:clinic_id])
  end

  def set_report_request
    @report_request = ReportRequest.find(params[:id])
  end

  def report_request_params
    params.require(:report_request).permit(:clinic_id, :patient_id, :date, :type, :expiration_date, :answer, documents: [])
  end
end
