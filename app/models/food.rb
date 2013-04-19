class Food
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
end
