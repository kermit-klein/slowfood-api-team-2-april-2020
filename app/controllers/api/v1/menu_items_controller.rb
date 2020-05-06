class Api::V1::MenuItemsController < ApplicationController
  def index
    if params[:category]
      items = MenuItem.where category: params[:category]
    else
      items = MenuItem.all
    end
    render json: { menu_items: items }
  end
end