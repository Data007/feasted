class Admin::Menus::Days::Meals::FoodsController < Admin::Menus::Days::MealsController
  before_filter :find_meal

  def index
    @foods = Food.all 
    @added_foods = @meal.foods
  end

  def create
    @food = Food.find(params[:food_id])
    @meal.foods << @food
    @meal.save!
    redirect_to admin_menu_day_meal_foods_path(@menu, @day, @meal)
  end

  def destroy
    @delete_food = Food.find(params[:id])
    @meal.foods = @meal.foods.reject {|food| food == @delete_food}
    redirect_to admin_menu_day_meal_foods_path(@menu, @day, @meal)
  end
end
