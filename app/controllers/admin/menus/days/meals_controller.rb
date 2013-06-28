class Admin::Menus::Days::MealsController < Admin::Menus::DaysController
  before_filter :find_day_for_today

  def index
  end

  def new
    @meal = Meal.create(kind: params[:id])
    @day.meals << @meal
    redirect_to admin_menu_day_meal_foods_path(@menu, @day, @meal)
  end
end
