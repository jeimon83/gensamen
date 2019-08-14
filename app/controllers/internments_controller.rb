class InternmentsController < ApplicationController
  def index
    @internments = Internment.all
    render json: @internments, status: :ok
  end
end
