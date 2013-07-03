class Admin::RoomsController < AdminController
  before_filter :find_room, except: [:index]
  
  def index
    @rooms = Room.all
  end

  def update_patients
    @room.update_patients(params[:patient_count])
    redirect_to [ :admin, @wing, @room]
  end

  def update_room_number
  end

  def update
    @room.update_attribute(:number, params[:number])
    redirect_to [:admin, @wing, @room], flash: {notice: "Your Room Number has been Updated"}
  end
private
  def find_room
    room_id = params[:room_id].present? ? params[:room_id] : params[:id]
    @room = Room.find(room_id)
  end
end
