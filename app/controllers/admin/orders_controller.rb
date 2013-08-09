class Admin::OrdersController < AdminController
  before_filter :find_order, except: [:index] 
  def index
    @orders = Order.all.select {|order| order.completed?}
    @orders = @orders.select {|order| order.created_at.today?}
  end

  def destroy
    @order.destroy
    redirect_to [:admin, :orders] 
  end

  def show
    @likes = @order.find_patient.likes
    @dislikes = @order.find_patient.dislikes
    @allergies = @order.find_patient.allergies
  end

private
  def find_order
    order_id = params[:order_id].present? ? params[:order_id] : params[:id]
    @order = Order.find(order_id)
  end
end
