class Admin::MenusController < AdminController
  before_filter :find_menu, except: [:new, :create, :index]

  def index
    @menu = initialize_menu
    redirect_to [:admin, @menu, :days]
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
