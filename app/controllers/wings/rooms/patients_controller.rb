class Wings::Rooms::PatientsController < Wings::RoomsController
  before_filter :find_room

  def index
    @patients = @room.patients
  end
end
