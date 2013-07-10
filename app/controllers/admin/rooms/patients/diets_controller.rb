class Admin::Rooms::Patients::DietsController < Admin::Rooms::PatientsController
  before_filter :find_patient
  before_filter :find_diet, except: [:index]

  def create
    @patient.diets << @diet
    @patient.save
    redirect_to admin_room_patient_diets_path(@room, @patient)
  end

  def destroy
    @patient.diets = @patient.diets.reject {|diet| diet == @diet}
    @patient.save
    redirect_to admin_room_patient_diets_path(@room, @patient)
  end

  def index
    @diets = Diet.all
  end

private
  def find_diet
    diet_id = params[:diet_id].present? ? params[:diet_id] : params[:id]
    @diet = Diet.find(diet_id)
  end
end
