# frozen_string_literal: true

class Api::V1::OrdersController < ApplicationController
  def create
    order = Order.create(user_id: params[:user])
    order.order_items.create(menu_item_id: params[:menu_item])
    render json: create_json_response(order)
  end

  def update
    order = Order.find(params[:id])
    case params[:activity]
    when "finalize"
      if !order.user.nil?
        order.update_attribute(:finalized, true)
        render json: { message: 'Your order will be ready in 30 minutes!' }
      else 
        render json: { message: 'You need to be logged in' }
      end
    when "login"
      order.update_attribute(:user_id, params[:user])
      render json: { message: 'User added to order' }
    else
      menu_item = MenuItem.find(params[:menu_item])
      order.order_items.create(menu_item: menu_item)
      render json: create_json_response(order)
    end
  end

  private

  def create_json_response(order)
    json = { order: OrderSerializer.new(order) }
    json.merge!(message: 'Item added to order')
  end
end
