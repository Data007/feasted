class Room
  include Mongoid::Document
  include Mongoid::Timestamps

  field :number, type: Integer

  belongs_to :wing
end
