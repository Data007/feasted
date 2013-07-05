class Menu
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :date

  has_and_belongs_to_many :food
  has_many :days


  def find_foods_for_day_and_meal(day, meal)
    menu_day = self.days.select {|daysofg| daysofg.day == day} 
    menu_day = menu_day.first
    if (menu_day == nil)
      return []
    end
    meals = menu_day.meals.select {|menu_meal| menu_meal.kind == meal} 
    meal = meals.first
    if meal == nil
      return []
    end
    @foods = meal.foods
    return @foods
  end
end
