class Allergy
  include Mongoid::Document
  include Mongoid::Timestamps

  field :kind

  belongs_to :patient
end
