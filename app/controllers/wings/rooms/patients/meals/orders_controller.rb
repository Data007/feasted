class Wings::Rooms::Patients::Meals::OrdersController < Wings::Rooms::Patients::MealsController
  before_filter :find_order, except: [:index]

  def index

  end

  def edit
    binding.pry
    @edible_foods = @order.meal.patient.foods(@order.meal)
    @foods = @order.foods
  end

  def edit_order
    binding.pry
  end

  def destroy
    @food = find_food
    @meal.foods = @meal.foods.reject {|food| food == @food}
    @meal.save!
    redirect_to [:edit, @wing, @room, @patient, @meal, @order] 
  end

  private

  def find_order
    order_id = params[:order_id].present? ? params[:order_id] : params[:id]
    @order = Order.find(order_id)
  end

  def find_food
    food_id = params[:food_id]
    @food = Food.find(food_id)
  end

  def find_patient order
    @order_patient = Patient.find(order.patient_id)
  end
end
