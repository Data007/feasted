class Diet
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name

  has_many :foods
  has_and_belongs_to_many :patient
end
