class Wings::Rooms::Patients::MealsController < Wings::Rooms::PatientsController
  before_filter :find_patient
  before_filter :find_meal, except: [:new, :index]

  def index

  end

  def new
    orders = Order.all.select {|order| order.created_at.today?}
    orders = orders.select {|order| order.kind == params[:kind]}
    orders = orders.select {|order| order.patient_id == @patient.id}
    order = orders.first

    unless orders.empty?
      meals = Meal.all.select {|meal| meal.id == order.meal_id}
      meal = meals.first
    end

    if orders.length >= 1
      redirect_to [:edit, @wing, @room, @patient, meal, order]
    else

      @meal = Meal.create(params)
      redirect_to edit_wing_room_patient_meal_path(@wing, @room, @patient, @meal) 
    end
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
    orders = orders.select {|order| order.kind == @meal.kind }
    unless orders.length >= 1 
      if @meal.foods.count <= 0 
        redirect_to [:edit, @wing, @room, @patient, @meal], flash: {error: "Please Add food to the Order!"}
        return
      end

      order = @meal.create_order(@meal)

      if orders_all_placed_for_today
        redirect_to [@wing, @room, :patients]
        return
      end

      redirect_to [@wing, @room, @patient, :meals], flash: {notice: "Your Order for #{@meal.kind} has been placed"}
      return
    end
    redirect_to [:edit, @wing,@room, @patient, @meal], flash: {notice: "Your Order has already been placed! You are now Editing that Order!"}
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

  def orders_all_placed_for_today
    number_of_meals = []
    number_of_meals = @patient.meals.select {|meal| meal.created_at.today?}
    if number_of_meals.count >= 3
      return true
    else
      return false
    end
  end
end
