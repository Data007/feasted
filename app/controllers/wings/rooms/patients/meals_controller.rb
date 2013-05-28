class Wings::Rooms::Patients::MealsController < Wings::Rooms::PatientsController
  before_filter :find_patient
  before_filter :find_meal, except: [:new, :index]

  def index

  end

  def new
    @meal = Meal.create(params)
    redirect_to edit_wing_room_patient_meal_path(@wing, @room, @patient, @meal) 
  end

  def edit
    @foods = @patient.foods(@meal)
  end

  def create
    @food = Food.find(params[:food_id])
    @meal.foods << @food
    @meal.save!
    redirect_to [:edit, @wing, @room, @patient, @meal]
  end

  def destroy
    @food = find_food
    @meal.foods = @meal.foods.reject {|food| food == @food}
    @meal.save!
    redirect_to [:edit, @wing, @room, @patient, @meal] 
  end

  def place_order
    orders = @meal.orders.select {|order| order.created_at.today?}
    orders = orders.select {|order| order.type == @meal.type }
    unless orders.length >= 1 
      @meal.create_order(@meal)
      redirect_to [:edit, @wing, @room, @patient, @meal, orders.first], flash: {notice: "Your Order has been placed"}
      return
    end
    redirect_to [:edit, @wing,@room, @patient, @meal, orders.first ], flash: {notice: "Your Order has already been placed! You are now Editing that Order!"}
  end
  
  private

  def find_meal
    meal_id = params[:meal_id].present? ? params[:meal_id] : params[:id]
    @meal = Meal.find(meal_id)
  end

  def find_food
    food_id = params[:food_id]
    @food = Food.find(food_id)
  end
end
