# frozen_string_literal: true

# Help Request Controller
class HelpRequestsController < ApplicationController
  before_action :set_internment, only: [:new, :create]
  before_action :set_help_request, only: [:update, :destroy]

  def create
    @help_request = @internment.help_requests.new(help_request_params)
    if @help_request.save
      render json: @help_request, serializer: HelpRequestSerializer
    else
      render json: @help_request.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @help_request.update(help_request_params)
      render json: @help_request, serializer: HelpRequestSerializer
    else
      render json: @help_request.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @help_request.destroy
    if @help_request.destroyed?
      render json: {}, status: :no_content
    else
      render json: @help_request.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def set_internment
    @internment = Internment.find(params[:internment_id])
  end

  def set_help_request
    @help_request = HelpRequest.find(params[:id])
  end

  def help_request_params
    params.require(:help_request).permit(:internment_id, :requested_date, :type, documents: [])
  end
end
