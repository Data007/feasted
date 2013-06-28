class Menu
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :date

  has_and_belongs_to_many :food
end
