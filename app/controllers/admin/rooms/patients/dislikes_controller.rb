class Admin::Rooms::Patients::DislikesController < Admin::Rooms::PatientsController
  before_filter :find_patient
  before_filter :find_dislike, except: [:new, :create, :index]

  def index
    @dislikes = @patient.dislikes
  end

  def new
    @dislike = Dislike.new
  end

  def create
    @patient.dislikes.create(params[:dislike])
    redirect_to [:admin, @room, @patient, :dislikes]
  end

  def update
    @dislike.update_attributes params[:dislike]
    redirect_to [:admin, @room, @patient, :dislikes]
  end

  def destroy
    @dislike.destroy
    redirect_to [:admin, @room, @patient, :dislikes]
  end
private
  def find_dislike
    dislike_id = params[:dislike_id].present? ? params[:dislike_id] : params[:id]
    @dislike = Dislike.find(dislike_id)
  end
end
