class Wings::Rooms::Patients::Meals::OrdersController < Wings::Rooms::Patients::MealsController
  before_filter :find_order, except: [:index, :new]
  before_filter :find_patient
  before_filter :find_meal

  def index

  end

  def new
    @order = Order.create(kind: @meal.kind, family_member: true, patient_id: @patient.id)
    redirect_to edit_wing_room_patient_meal_order_path(@wing, @room, @patient, @meal, @order)
  end

  def edit
    @foods = Food.all
    @destroy_foods = @order.foods
  end

  def edit_order
    @food = find_food
    @order.foods += [@food]
    redirect_to [:edit, @wing, @room, @patient, @meal, @order]
  end

  def destroy
    @food = find_food
    @order.foods = @order.foods.delete_if {|food| food == @food}
    redirect_to [:edit, @wing, @room, @patient, @meal, @order] 
  end

  def place_order
    @order.update_attribute(:completed, true)
    @order.update_attribute(:meal_id, @meal.id)
    @order.update_attribute(:patient_id, @patient.id)
    @order.meal_ids << @meal.id
    @order.save
    redirect_to [@wing, @room, @patient, :meals], flash: {notice: "Your Order for #{@meal.kind} has been placed"}
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
