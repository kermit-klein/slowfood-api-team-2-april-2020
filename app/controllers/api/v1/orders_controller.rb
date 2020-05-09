# frozen_string_literal: true

class Api::V1::OrdersController < ApplicationController
  def create
    order = Order.create(user_id: params[:user])
    order.order_items.create(menu_item_id: params[:menu_item])
    render json: create_json_response(order)
  end

  def update
    order = Order.find(params[:id])
    menu_item = MenuItem.find(params[:menu_item])
    order.order_items.create(menu_item: menu_item)
    render json: create_json_response(order)
  end

  private

  def create_json_response(order)
    json = { order: OrderSerializer.new(order) }
    json.merge!(message: 'Item added to order')
  end
end
