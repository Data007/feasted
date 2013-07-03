class Completed
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :patient
end
