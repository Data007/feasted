class Food
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name

  belongs_to :diet
end
