class Admin::Rooms::Patients::AllergiesController < Admin::Rooms::PatientsController
  before_filter :find_patient 
  before_filter :find_allergy, except: [:new, :create, :index]

  def new
    @allergy = Allergy.new
  end

  def create
    @patient.allergies.create(params[:allergy])
    redirect_to [:admin, @room, @patient, :allergies]
  end

  def index
    @allergies = @patient.allergies
  end

  def update
    @allergy.update_attributes params[:allergy]
    redirect_to [:admin, @room, @patient, :allergies]
  end

private
  def find_allergy
    allergy_id = params[:allergy_id].present? ? params[:allergy_id] : params[:id]
    @allergy = Allergy.find(allergy_id)
  end
end
