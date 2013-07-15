class Admin::Rooms::PatientsController < Admin::RoomsController
  before_filter :find_room
  before_filter :find_patient, except: [:index, :new, :create]

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
    redirect_to edit_admin_room_patient_path(@room, @patient)
  end

  def edit_patient_name
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = @room.patients.create(params[:patient])
    redirect_to admin_room_patients_path(@room)
  end

  def update
    @patient.update_attributes params[:patient]
    redirect_to [:edit, :admin, @room, @patient]
  end

  def destroy
    @patient.destroy
    redirect_to [:admin, @room, :patients]
  end

private
  def find_patient
    patient_id = params[:patient_id].present? ? params[:patient_id] : params[:id]
    @patient = Patient.find(patient_id)
  end
end
