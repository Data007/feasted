class Food
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :kind, default: 'Breakfast'

  belongs_to :diet
  has_and_belongs_to_many :meals
  has_and_belongs_to_many :menus
  has_and_belongs_to_many :orders, :inverse_of => nil
end
