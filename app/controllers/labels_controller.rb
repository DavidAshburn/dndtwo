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
    pcraces = Race.all.sort { |a,b| a.name <=> b.name }
    subraces = pcraces.first.subraces.all.sort { |a,b| a.name <=> b.name }
    pclasses = PlayerClass.all.sort { |a,b| a.name <=> b.name }
    subclasses = pclasses.first.subclasses.all.select{ |item| item.name == "None"}
    backgrounds = Background.all.sort { |a,b| a.name <=> b.name }

    @initial = { pcrace: pcraces[0], subrace: subraces[0], pclass: pclasses[0], subclass: subclasses[0], background: backgrounds[0] }

    respond_to do |format|
      format.json { render json: @initial}
    end
  end

end

#output


