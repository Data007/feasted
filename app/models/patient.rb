class Patient
  include Mongoid::Document
  include Mongoid::Timestamps

  field :number

  belongs_to :room
  has_many :diets
  has_many :meals
end
