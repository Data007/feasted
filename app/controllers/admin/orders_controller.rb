class Admin::OrdersController < AdminController
  def index
    @orders = Order.all.select {|order| order.completed?}
    @orders = @orders.select {|order| order.created_at.today?}
  end
end
