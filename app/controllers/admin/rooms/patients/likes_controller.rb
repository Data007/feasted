class Admin::Rooms::Patients::LikesController < Admin::Rooms::PatientsController
  before_filter :find_patient 
  before_filter :find_like, except: [:new, :create, :index]
  
  def index
    @likes = @patient.likes
  end

  def new
    @like = Like.new
  end

  def create
    @patient.likes.create(params[:like])
    redirect_to [:admin, @room, @patient, :likes]
  end

  def update
    @like.update_attributes params[:like]
    redirect_to [:admin, @room, @patient, :likes]
  end

  def destroy
    @like.destroy
    redirect_to [:admin, @room, @patient, :likes]
  end
private
  def find_like
    like_id = params[:like_id].present? ? params[:like_id] : params[:id]
    @like = Like.find(like_id)
  end
end
