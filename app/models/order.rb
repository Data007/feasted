class Order
  include Mongoid::Document
  include Mongoid::Timestamps

  has_one :patient
end
