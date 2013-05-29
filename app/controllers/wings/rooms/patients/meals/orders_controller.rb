class Wings::Rooms::Patients::Meals::OrdersController < Wings::Rooms::Patients::MealsController
  before_filter :find_order, except: [:index]
  before_filter :find_patient
  before_filter :find_meal

  def index

  end

  def edit
    @edible_foods = @patient.foods(@meal)
    @foods = @order.foods
  end

  def edit_order
    @food = find_food
    binding.pry
    @order.foods += [@order]
    redirect_to [:edit, @wing, @room, @patient, @meal, @order]
  end

  def destroy
    binding.pry
    @food = find_food
    @order.foods = @order.foods.delete_if {|food| food == @food}
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
end
