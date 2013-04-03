class WingsController < ApplicationController
  before_filter :find_wing, except: [:index]

  def index
    @wings = Wing.all
  end

private
  def find_wing
    wing_id = params[:wing_id].present? ? params[:wing_id] : params[:id]
    @wing = Wing.find(wing_id)
  end
end
