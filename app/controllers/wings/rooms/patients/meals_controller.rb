class Wings::Rooms::Patients::MealsController < Wings::Rooms::PatientsController
  before_filter :find_patient

  def index

  end
end
