class Api::V1::OrdersController < ApplicationController
  def create
    order = Order.create(user_id: params[:user])
    order.order_items.create(menu_item_id: params[:menu_item])
    render json: { id: order.id, message: "Item added to order" }
  end
end
