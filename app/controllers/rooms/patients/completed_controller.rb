class Rooms::Patients::CompletedController < Rooms::PatientsController
  
  def new
    @patient.completed.create
    @patient.save

    if patients_all_placed_for_today(@room)
      redirect_to [:rooms]
      return
    else
      redirect_to [@room, :patients]
    end
  end
end
