class SubracesController < ApplicationController
  before_action :set_subrace, only: [ :show ]

  def index
    @subraces = Subrace.all

    respond_to do |format|
      format.json { render json: @subraces }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @subrace }
    end
  end

  private
  def set_subrace
    @subrace = Subrace.find_by(name: params[:name])
  end
end
