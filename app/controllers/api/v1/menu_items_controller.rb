class Api::V1::MenuItemsController < ApplicationController
  def index
    items = MenuItem.all
    render json: { menu_items: items }
  end
end