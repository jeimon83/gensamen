# frozen_string_literal: true

# Authentication Controller
class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request, only: [:authenticate]
  before_action :get_subdomain
  def check
    render json: { user: @current_user.to_json }, status: :ok
  end

  def authenticate
    command = AuthenticateUser.call(params[:auth][:email], params[:auth][:password])
    current_user = command.parsed_user
    if command.success?
      render json: { auth_token: command.result, user: current_user.to_json }, status: :created
    else
      render json: command.errors, status: :unauthorized
    end
  end
end
