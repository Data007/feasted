class Order
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :type

  has_one :patient
  has_one :meal
  has_many :foods
end
