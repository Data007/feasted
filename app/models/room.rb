class Room
  include Mongoid::Document
  include Mongoid::Timestamps

  field :number, type: Integer

  has_many :patients

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
