class Admin::Diets::FoodsController < Admin::DietsController
  before_filter :find_diet

  def index
    @foods = Food.all
  end

  def create
    @food = Food.find(params[:food_id])
    @diet.foods << @food
    @diet.save!
    redirect_to admin_diet_foods_path(@diet)
  end
end
