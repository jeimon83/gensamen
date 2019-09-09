# frozen_string_literal: true

# Users Controller
class UsersController < ApplicationController

  def index
    service = Search::User.new(params)
    service.run
    users = service.data.map { |user| { id: user.id, email: user.email, name: user.full_name } }
    render json: { users: users, meta: service.metadata }
  end

  def update
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
