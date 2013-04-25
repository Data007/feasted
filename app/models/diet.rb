class Diet
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name

  has_many :foods
  belongs_to :patient
end
