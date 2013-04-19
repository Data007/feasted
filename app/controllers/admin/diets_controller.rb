class Admin::DietsController < ApplicationController
  before_filter :find_diet, except: [:new, :create, :index]

  def new
    @diet = Diet.new
  end

  def create
    @diet = Diet.create params[:diet]
    redirect_to admin_diets_path
  end

  def index
    @diets = Diet.all
  end

  def update
    @diet.update_attributes params[:diet]
    redirect_to [:admin, :diets], flash: {notice: 'Your Diet has been Updating'}
  end

  def destroy
    @diet.destroy
    redirect_to [:admin, :diets], flash: {notice: "Your Diet has been Deleted"}
  end

private
  def find_diet
    diet_id = params[:diet_id].present? ? params[:diet_id] : params[:id]
    @diet = Diet.find(diet_id)
    
  end
end
