# frozen_string_literal: true

# Users Controller
class UsersController < ApplicationController
  def index
    service = Search::User.new(current_user, params)
    service.run
    render json: service.data, each_serializer: UserSerializer, meta: service.metadata
  end

  def profile
    render json: current_user
  end

  def update_profile
    if current_user.update(user_params)
      render json: current_user, serializer: UserSerializer
    else
      render json: current_user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :password)
  end
end
