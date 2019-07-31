# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::API
  #before_action :authenticate_request, except: [:service]
  attr_reader :current_user

  def current_user
    @current_user
  end

  def service
    render json: { status: 'ok' }, status: 200
  end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
