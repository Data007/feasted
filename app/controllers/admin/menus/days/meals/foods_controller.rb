class Admin::Menus::Days::Meals::FoodsController < Admin::Menus::Days::MealsController
  before_filter :find_meal

  def index
    @foods = Food.all 
    @added_foods = @meal.foods
  end

  def create
    @food = Food.find(params[:id])
    @meal.foods << @food
    @meal.save!
    redirect_to admin_menu_day_meal_foods_path(@menu, @day, @meal)
  end

  def destroy
    @delete_food = Food.find(params[:id])
    @meal.foods = @meal.foods.reject {|food| food == @delete_food}
    redirect_to admin_menu_day_meal_foods_path(@menu, @day, @meal)
  end
  
private
  def find_meal
    meal_id = params[:meal_id].present? ? params[:meal_id] : params[:id]
    @meal = Meal.find(meal_id)

  end
end
