class Admin::Rooms::Patients::AllergiesController < Admin::Rooms::PatientsController
  before_filter :find_patient 

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
end
