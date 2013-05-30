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

  def color
    return "red"
  end
end
