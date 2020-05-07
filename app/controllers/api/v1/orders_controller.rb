class Api::V1::OrdersController < ApplicationController
  def create
    order = Order.create
    order.order_items.create(params["menu_item".id])
    render json: { id: order.id }
  end
end