class Room
  include Mongoid::Document
  include Mongoid::Timestamps

  field :number, type: Integer

  belongs_to :wing
  has_many :patients

  def update_patients(patient_count)
    patient_count = patient_count.to_i
    if(!patients.present?)
      instantiate_patients(patient_count)
    elsif(patients.count > patient_count)
      patients.last.destroy
    else
      patients.create number: 2
    end
    return patients
  end

  def instantiate_patients(patient_count)
    patient_count.times do |index|
      self.patients.create number: (index + 1)
    end
  end
end
