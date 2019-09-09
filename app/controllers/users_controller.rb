# frozen_string_literal: true

# Users Controller
class UsersController < ApplicationController
  before_action :set_user, only: [:update]

  def index
    service = Search::User.new(params)
    service.run
    users = service.data.map { |user| { id: user.id, email: user.email, name: user.full_name } }
    render json: { users: users, meta: service.metadata }
  end

  def update
    if @user.update(user_params)
      render json: @user, serializer: UserSerializer
    else
      render json: @clinic.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :phone, :role, :password, :clinic_id)
  end
end
