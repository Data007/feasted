class Day
  include Mongoid::Document
  include Mongoid::Timestamps

  field :day

  belongs_to :menu
  has_many :meals
end
