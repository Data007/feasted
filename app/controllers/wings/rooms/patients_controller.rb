class Wings::Rooms::PatientsController < Wings::RoomsController
  before_filter :find_room
  before_filter :find_patient, except: [:index]

  def index
    @patients = @room.patients
  end

  def edit
  end

  def destroy
  end

private
  def find_patient
    patient_id = params[:patient_id].present? ? params[:patient_id] : params[:id]
    @patient = Patient.find(patient_id)
  end
end
