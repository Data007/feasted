class Admin::Wings::RoomsController < Admin::WingsController

  before_filter :find_wing
  
  def index
    @rooms = @wing.rooms
  end

  def edit
  end
end
