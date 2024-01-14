class PlayerClassesController < ApplicationController
  before_action :set_pclass, only: [ :show ]

  def index
    @player_classes = PlayerClass.all

    respond_to do |format|
      format.json { render json: @player_classes }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @player_class }
    end
  end

  private
  def set_pclass
    @player_class = PlayerClass.find_by(name: params[:name])
  end
end
