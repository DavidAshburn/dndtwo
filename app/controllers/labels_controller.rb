class LabelsController < ApplicationController
  def dropdowns
    @races = Race.order(:name).map{|race| [race.name, race.subraces.order(:id).map{|sub| sub.name}]}
    @classes = PlayerClass.order(:name).map{|pclass| [pclass.name, pclass.subclasses.order(:id).map{|sub| sub.name}]}
    @bgs = Background.order(:name).map{|bg| bg.name}

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
    pcrace = Race.order(:name)[0]
    subrace = pcrace.subraces.order(:name)[0].name
    pclass = PlayerClass.order(:name)[0]
    subclass = pclass.subclasses.order(:name)[0].name
    background = Background.order(:name)[0].name

    @initial = { pcrace: pcrace.name, subrace: subrace, pclass: pclass.name, subclass: subclass, background: background }

    respond_to do |format|
      format.json { render json: @initial}
    end
  end

end

#output


