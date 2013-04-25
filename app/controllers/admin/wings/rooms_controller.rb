class Admin::Wings::RoomsController < Admin::WingsController
  before_filter :find_wing
  before_filter :find_room, except: [:index]
  
  def index
    @rooms = @wing.rooms
  end

  def update_patients
    @room.update_patients(params[:patient_count])
    redirect_to [:edit, :admin, @wing, @room]
  end
private
  def find_room
    room_id = params[:room_id].present? ? params[:room_id] : params[:id]
    @room = Room.find(room_id)
  end
end
