class Order
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :kind
  field :family_member, type: Boolean, default: false
  field :completed, type: Boolean, default: false

  has_one :patient
  has_and_belongs_to_many :meal
  has_and_belongs_to_many :foods


  def find_patient
    return Patient.find(patient_id)
  end

  def find_room
    return Room.find(room_id)
  end
end
