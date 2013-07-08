class Room
  include Mongoid::Document
  include Mongoid::Timestamps

  field :number, type: Integer

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

  def color
    patients_ordered = []
    patients.each do |patient|
      patients_ordered << patient.patient_color
    end
    if patients_ordered.include?("redDark")
      return "redDark"
    else
      return "green"
    end
  end

  def has_patients?
    if patients.present?
      if patients.first.name.present?
        return true
      elsif patients.last.name.present?
        return true
      else
        return false
      end
    else
      return false
    end
  end
end
