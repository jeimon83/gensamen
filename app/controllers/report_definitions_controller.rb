# frozen_string_literal: true

# Report Definitions Controller
class ReportDefinitionsController < ApplicationController
  before_action :set_report_definition, only: [:show, :update, :destroy]

  def index
    @report_definitions = ReportDefinition.all
    render json: @report_definitions, status: :ok
  end

  def create
    @report_definition = ReportDefinition.new(report_definition_params)
    if @report_definition.save
      render json: @report_definition, serializer: ReportDefinitionSerializer
    else
      render json: @report_definition.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: @report_definition
  end

  def update
    if @report_definition.update(report_definition_params)
      render json: @report_definition, serializer: ReportDefinitionSerializer
    else
      render json: @report_definition.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @report_definition.destroy
    if @report_definition.destroyed?
      render json: {}, status: :no_content
    else
      render json: @report_definition.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def set_report_definition
    @report_definition = ReportDefinition.find(params[:id])
  end

  def report_definition_params
    params.require(:report_definition).permit(:name, :type, :period_type, :period_quantity, :text)
  end
end
