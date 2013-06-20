class Order
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :kind
  field :family_member, type: Boolean, default: false
  field :completed, type: Boolean, default: false

  has_one :patient
  has_and_belongs_to_many :meal
  has_and_belongs_to_many :foods
end
