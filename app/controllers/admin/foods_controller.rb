class Admin::FoodsController < AdminController
  before_filter :find_diet, except: [:new, :create, :index]

  def new
    @food = Food.new
  end

  def create
    @food = Food.create params[:food]
    redirect_to admin_foods_path
  end

  def index
    @foods = Food.all
  end

  def update
    @food.update_attributes params[:food]
    redirect_to [:admin, :foods], flash: {notice: 'Your Food Item has been Updating'}
  end

  def destroy
    @food.destroy
    redirect_to [:admin, :foods], flash: {notice: "Your Food Item has been Deleted"}
  end

private
  def find_diet
    food_id = params[:food_id].present? ? params[:food_id] : params[:id]
    @food = Food.find(food_id)
    
  end
  
end
