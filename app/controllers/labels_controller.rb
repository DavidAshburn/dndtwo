class LabelsController < ApplicationController
  def dropdowns
    @races = Race.all.map{|race| [race.name, race.subraces.map{|sub| sub.name}]}
    @classes = PlayerClass.all.map{|pclass| [pclass.name, pclass.subclasses.map{|sub| sub.name}]}
    @bgs = Background.all.map{|bg| bg.name}

    @labels = {
      :races => @races,
      :classes => @classes,
      :backgrounds => @bgs
    }
    respond_to do |format|
      format.json { render json: @labels}
    end
  end

  def initPC
    @pcrace = Race.first
    @subrace = Race.first.subraces.first
    @pclass = PlayerClass.first
    @subclass = PlayerClass.first.subclasses.first
    @background = Background.first

    @initial = { pcrace: @pcrace, subrace: @subrace, pclass: @pclass, subclass: @subclass, background: @background }

    respond_to do |format|
      format.json { render json: @initial}
    end
  end

end

#output


