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

  def destroy
    @delete_food = Food.find(params[:id])
    @diet.foods = @diet.foods.reject {|food| food == @delete_food}
    redirect_to admin_diet_foods_path(@diet)
  end
end
