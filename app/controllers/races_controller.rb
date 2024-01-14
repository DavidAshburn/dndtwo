class RacesController < ApplicationController
  before_action :set_race, only: [ :show ]

  def index
    @races = Race.all

    respond_to do |format|
      format.json { render json: @races }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @race }
    end
  end

  def subs
    @subs = Race.find_by(name: params[:name]).subraces.count
    respond_to do |format|
      format.json { render json: @subs }
    end
  end

  private
  def set_race
    @race = Race.find_by(name: params[:name])
  end
end
