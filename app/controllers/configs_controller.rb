# frozen_string_literal: true

# Configs Controller
class ConfigsController < ApplicationController
  before_action :set_config, only: [:show, :update, :destroy]

  def index
    @configs = Config.all
    render json: @configs, status: :ok
  end

  def create
    @config = Config.new(config_params)
    if @config.save
      render json: @config, serializer: ConfigSerializer
    else
      render json: @config.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: @config
  end

  def update
    if @config.update(config_params)
      render json: @config, serializer: ConfigSerializer
    else
      render json: @config.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def destroy
    @config.destroy
    if @config.destroyed?
      render json: {}, status: :no_content
    else
      render json: @config.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def set_config
     @config = Config.find(params[:id])
  end

  def config_params
    params.require(:config).permit(:checklist) 
  end

end
