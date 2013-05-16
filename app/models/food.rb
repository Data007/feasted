class Food
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :type, default: 'Breakfast'

  belongs_to :diet
  belongs_to :meal
end
