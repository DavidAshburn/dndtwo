class SubclassesController < ApplicationController
  before_action :set_subclass, only: [ :show ]

  def index
    @subclasses = Subclass.all

    respond_to do |format|
      format.json { render json: @subclasses }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @subclass }
    end
  end

  private
  def set_subclass
    @subclass = Subclass.find_by(name: params[:name])
  end
end