# frozen_string_literal: true

# Users Controller
class UsersController < ApplicationController
  def index
    service = Search::User.new(current_user, params)
    service.run
    render json: service.data, each_serializer: UserSerializer, meta: service.metadata
  end
end