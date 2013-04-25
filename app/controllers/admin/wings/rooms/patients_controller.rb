class Admin::Wings::Rooms::PatientsController < Admin::Wings::RoomsController
  before_filter :find_wing
  before_filter :find_room
  before_filter :find_patient, except: [:index]

  def index
    @patients = @room.patients
  end

  def edit
    @diets = Diet.all
  end

  def create
    @diet = Diet.find(params[:diet_id])
    @patient.diets << @diet
    @patient.save
    redirect_to edit_admin_wing_room_patient_path(@wing, @room, @patient)
  end

  def destroy
    @delete_diet = Diet.find(params[:id])
    @patient.diets = @patient.diets.reject {|diet| diet == @delete_diet}
    redirect_to edit_admin_wing_room_patient_path(@wing, @room, @patient)
  end

private
  def find_patient
    patient_id = params[:patient_id].present? ? params[:patient_id] : params[:id]
    @patient = Patient.find(patient_id)
  end

end
