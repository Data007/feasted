class Meal
  include Mongoid::Document
  include Mongoid::Timestamps

  field :type

  belongs_to :patient
  has_many :orders

end
