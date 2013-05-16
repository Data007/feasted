class Wings::Rooms::Patients::MealsController < Wings::Rooms::PatientsController
  before_filter :find_patient

  def index

  end

  def new
    @meal = Meal.create(params)
    redirect_to edit_wing_room_patient_meal_path(@wing, @room, @patient, @meal) 
  end

  def edit

  end
end
