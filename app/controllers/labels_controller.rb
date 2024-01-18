class LabelsController < ApplicationController
  def dropdowns
    @races = Race.all.map{|race| [race.name, race.subraces.map{|sub| sub.name}]}.sort { |a, b| a[0] <=> b[0]}
    @classes = PlayerClass.all.map{|pclass| [pclass.name, pclass.subclasses.map{|sub| sub.name}]}.sort { |a, b| a[0] <=> b[0]}
    @bgs = Background.all.map{|bg| bg.name}.sort { |a, b| a[0] <=> b[0]}

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
    subclasses = pclasses.first.subclasses.all.sort { |a,b| a.name <=> b.name }
    backgrounds = Background.all.sort { |a,b| a.name <=> b.name }

    @initial = { pcrace: pcraces[0], subrace: subraces[0], pclass: pclasses[0], subclass: subclasses[0], background: backgrounds[0] }

    respond_to do |format|
      format.json { render json: @initial}
    end
  end

end

#output


