class Wings::RoomsController < WingsController
  before_filter :find_wing
  def index
    @rooms = @wing.rooms
  end
end
