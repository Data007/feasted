class Patient
  include Mongoid::Document
  include Mongoid::Timestamps

  field :number

  belongs_to :room
  has_many :diets
  has_many :meals


  def foods meal_object
    self.diets.each do |diet|
      @foods = diet.foods.select {|food| food.kind == meal_object.type}
    end

    if @foods != nil
      return @foods
    else
      return []
    end
  end

  def color meal_time
    meals = self.meals.select {|meal| meal.created_at.today?}
    meals_kind = meals.select {|meal| meal.type == meal_time} 
    temp = meals_kind.select {|mealp| mealp.orders.present?}
    if temp.length >= 1
      return 'green'
    else
      return "redDark"
    end
  end
end
