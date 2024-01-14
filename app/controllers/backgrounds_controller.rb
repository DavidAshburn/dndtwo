class BackgroundsController < ApplicationController
  before_action :set_background, only: [ :show ]

  def index
    @backgrounds = Background.all

    respond_to do |format|
      format.json { render json: @backgrounds }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @background }
    end
  end

  private
  def set_background
    @background = Background.find_by(name: params[:name])
  end
end