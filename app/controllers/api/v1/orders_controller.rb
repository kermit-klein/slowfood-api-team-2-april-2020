# frozen_string_literal: true

class Api::V1::OrdersController < ApplicationController
  def create
    order = Order.create(user_id: params[:user])
    order.order_items.create(menu_item_id: params[:menu_item])
    render json: { id: order.id, message: 'Item added to order' }
  end

  def update
    order = Order.find(params[:id])
    menu_item = MenuItem.find(params[:menu_item])
    order.order_items.create(menu_item: menu_item)
    render json: { message: 'Item added to order', id: order.id }
  end
end
