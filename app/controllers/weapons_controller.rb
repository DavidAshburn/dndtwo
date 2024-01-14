class WeaponsController < ApplicationController
  before_action :set_weapon, only: [ :show ]

  def index
    @weapons = [1,2,3,4,5]

    respond_to do |format|
      format.json { render json: @weapons}
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @weapons }
    end
  end

  private
  def set_weapon
    @weapons = Weapon.where(wep_type: params[:wep_type])
  end
end