class Day
  include Mongoid::Document
  include Mongoid::Timestamps

  field :day

  belongs_to :menu
end
