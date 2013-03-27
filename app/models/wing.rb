class Wing
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :amount_of_rooms, type: Integer
end
