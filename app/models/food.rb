class Food
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :kind, default: 'Breakfast'

  belongs_to :diet
  belongs_to :meal
  has_and_belongs_to_many :menu
  has_and_belongs_to_many :orders, :inverse_of => nil
end
