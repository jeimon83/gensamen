# frozen_string_literal: true

# Users Controller
class UsersController < ApplicationController
  def index
    service = Search::User.new(params)
    service.run
    users = service.data.map { |user| { id: user.id, email: user.email, name: user.full_name } }
    render json: { users: users, meta: service.metadata }
  end
end