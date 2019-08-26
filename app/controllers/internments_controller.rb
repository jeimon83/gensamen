# frozen_string_literal: true

# Internment Controller
class InternmentsController < ApplicationController
  before_action :set_internment, only: [:show, :update, :destroy]

 def index
    service = Search::Internment.new(params)
    service.run
    internments = service.data.map { |i| { id: i.id, begin_date: i.begin_date, type: i.type, end_date: i.end_date } }
    render json: { internments: internments, meta: service.metadata }
  end
 
  def create
    @internment = Internment.new(internment_params)
    if @internment.save
      render json: @internment, serializer: InternmentSerializer
    else
      render json: @internment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: @internment
  end

  def update
    if @internment.update(internment_params)
      render json: @internment, serializer: InternmentSerializer
    else
      render json: @internment.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def destroy
    @internment.destroy
    if @internment.destroyed?
      render json: {}, status: :no_content
    else
      render json: @internment.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def set_internment
     @internment = Internment.find(params[:id])
  end

  def internment_params
    params.require(:internment).permit(:begin_date, :type, :end_date, :patient) 
  end

end
