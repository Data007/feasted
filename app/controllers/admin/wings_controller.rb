class Admin::WingsController < AdminController
  
  def new
    binding.pry
    @wing = Wing.new
  end

  def create
    binding.pry
    @wing = Wing.create params[:wing]
    redirect_to admin_wings_path
  end

end
