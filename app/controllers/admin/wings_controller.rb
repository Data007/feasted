class Admin::WingsController < AdminController
  before_filter :find_wing, except: [:new, :create, :index]
  
  def new
    @wing = Wing.new
  end

  def create
    @wing = Wing.create params[:wing]
    @wing.instantiate_rooms
    redirect_to admin_wings_path
  end

  def update
    @wing.update_attributes params[:wing]
    redirect_to [:admin, :wings], flash: {notice: 'Your Wing has been updated'}
  end

  def destroy
    @wing.destroy
    redirect_to [:admin, :wings], flash: {notice: "Your Wing has been Deleted"}
  end

  def index
    @wings = Wing.all
  end

private
  def find_wing
    wing_id = params[:wing_id].present? ? params[:wing_id] : params[:id]
    @wing = Wing.find(wing_id)
  end
end
