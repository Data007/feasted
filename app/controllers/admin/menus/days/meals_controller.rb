class Admin::Menus::Days::MealsController < Admin::Menus::DaysController
  before_filter :find_day_for_today

  def index
  end

  def new
    @meal = Meal.create(kind: params[:id])
    @day.meals << @meal
    redirect_to admin_menu_day_meal_foods_path(@menu, @day, @meal)
  end

private
  def find_meal
    meal_id = params[:meal_id].present? ? params[:meal_id] : params[:id]
    @meal = Meal.find(meal_id)

  end
end
