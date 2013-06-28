class Admin::Menus::DaysController < Admin::MenusController
  before_filter :find_menu

  def new
    @day = Day.create(day: params[:id], menu_id: params[:menu_id])
    @menu.days << @day
    redirect_to admin_menu_day_meals_path(@menu, @day)
  end

  def index
  end
end
