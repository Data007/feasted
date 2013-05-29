class Order
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :kind

  has_one :patient
  has_one :meal
  has_and_belongs_to_many :foods
end
