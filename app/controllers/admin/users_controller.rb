# frozen_string_literal: true

# Class Admin
class Admin
  # Admin Users Controller
  class UsersController < ApplicationController
    def index
      @users = User.all
      render json: @users, status: :ok
    end
  end
end
