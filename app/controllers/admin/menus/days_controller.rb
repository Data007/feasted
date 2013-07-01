class Admin::Menus::DaysController < Admin::MenusController
  before_filter :find_menu
  

  def new
    if find_day(params[:id])
      @day = find_day(params[:id])
      redirect_to [:admin, @menu, @day, :meals]
      return
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
      return menu_days.first
    else
      return false
    end
  end

  def find_day_for_today
    day_id = params[:day_id].present? ? params[:day_id] : params[:id]
    @day = Day.find(day_id)
  end

end
