class Admin::Menus::DaysController < Admin::MenusController
  before_filter :find_menu
  

  def new
    if find_day(params[:id])
      binding.pry
      redirect_to [:admin, @menu, @day]
    else
      @day = Day.create(day: params[:id], menu_id: params[:menu_id])
      @menu.days << @day
      redirect_to admin_menu_day_meals_path(@menu, @day)
    end
  end

  def index
  end

private
  def find_day params_day
    menu_days = []
    menu_days = @menu.days.select {|dayofg| dayofg.day == params_day}
    if menu_days.count >= 1
      return false
    else
      return menu_days.first
    end
  end

end
