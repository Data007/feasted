class FamilyMember
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :completed, type: Boolean, default: False

  belongs_to :patient
  has_and_belongs_to_many :diets
  has_many :meals


end
