class Patient
  include Mongoid::Document
  include Mongoid::Timestamps

  field :number
  field :name

  belongs_to :room
  has_and_belongs_to_many :diets
  has_many :meals
  has_many :orders


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

  def color meal_time
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
