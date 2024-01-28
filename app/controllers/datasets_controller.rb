class DatasetsController < ApplicationController
  def spells
    @spells = Spell.all

    respond_to do |format|
      format.json { render json: @spells }
    end
  end

  def equipables
    @everything = {
      armor: Armor.all,
      weapons: Weapon.all,
      equipment: Equipment.all,
      tools: Tool.all
    }

    respond_to do |format|
      format.json { render json: @everything }
    end
  end
end
