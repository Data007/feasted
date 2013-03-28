class WingsController < ApplicationController

  def index
    @wings = Wing.all
  end
end
