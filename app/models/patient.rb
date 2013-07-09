class Patient
  include Mongoid::Document
  include Mongoid::Timestamps

  field :number
  field :name

  belongs_to :room
  has_and_belongs_to_many :diets
  has_many :meals
  has_many :orders
  has_many :completed
  has_many :allergies


  def foods meal_object
    @foods = []
    self.diets.each do |diet|
      @foods += diet.foods.select {|food| food.kind == meal_object.kind}
    end


    if @foods != nil
      return @foods
    else
      return []
    end
  end

  def menu_foods_with_diets menu_foods
    @foods = []
    self.diets.each do |diet|
      diet_foods = diet.foods
      diet_foods.each do |food|
        menu_foods.each do |menu_food|
          if food == menu_food
            @foods << food
          end
        end
      end
    end
    return @foods
  end

  def color meal_time
    completed_for_today = completed.select {|complete| complete.created_at.today?}

    if completed_for_today.length >=1
      return 'green'
    end

    meals = self.meals.select {|meal| meal.created_at.today?}
    meals_kind = meals.select {|meal| meal.kind == meal_time} 
    temp = meals_kind.select {|mealp| mealp.orders.present?}
    if temp.length >= 1
      return 'green'
    else
      return "redDark"
    end
  end

  def patient_color
    meals_ordered = [color("Breakfast"), color("Lunch"), color("Supper")]
    if meals_ordered.include?("redDark")
      return "redDark"
    else
      return "green"
    end
  end
end
