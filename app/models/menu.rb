class Menu
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :date

end
