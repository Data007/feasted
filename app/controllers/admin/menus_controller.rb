class Admin::MenusController < AdminController
  before_filter :find_menu, except: [:new, :create, :index]

  def index
    @menu = initialize_menu
    redirect_to [:admin, @menu, :days]
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.create(params[:menu])
    redirect_to admin_menus_path
  end

  def edit
  end

  def update
    @menu.update_attributes params[:menu]
    redirect_to admin_menus_path
  end

  def destroy
    @menu.destroy
    redirect_to [:admin, :menus], flash: {notice: "Your Menu has been deleted"}
  end
private
  def find_menu
    menu_id = params[:menu_id].present? ? params[:menu_id] : params[:id]
    @menu = Menu.find(menu_id)
  end

  def initialize_menu
    if Menu.all.count >= 1
      return Menu.all.first
    else
      return Menu.create
    end
  end
end
