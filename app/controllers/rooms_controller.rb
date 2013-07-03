class RoomsController < AdminController
  before_filter :find_room, except: [:index]

  def index
    @rooms = Room.all
  end

private
  def find_room
    room_id = params[:room_id].present? ? params[:room_id] : params[:id]
    @room = Room.find(room_id)
  end

  def orders_all_placed_for_today patient
    completed_orders = patient.completed.select {|complete| complete.created_at.today?}
    if completed_orders.length >= 1
      return true
    end
    number_of_orders = []
    number_of_orders = patient.orders.select {|order| order.created_at.today?}
    number_of_orders = number_of_orders.select {|order| order.completed}
    if number_of_orders.count >= 3
      return true
    else
      return false
    end
  end

  def patients_all_placed_for_today room
    patients_orders_placed = []
    room.patients.each do |patient|
      patients_orders_placed << orders_all_placed_for_today(patient)
    end
    if patients_orders_placed.include?(false)
      return false
    else 
      return true
    end
  end
  def rooms_all_placed_for_today
    rooms_orders_placed = []
    Room.all.each do |room|
      rooms_orders_placed << patients_all_placed_for_today(room)
    end

    if rooms_orders_placed.include?(false)
      return false
    else
      return true
    end
  end
end
