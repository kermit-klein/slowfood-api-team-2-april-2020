class Api::V1::MenuItemsController < ApplicationController
  def index
    if (params[:category].nil? || params[:category] == "") then
      items = MenuItem.all
    else
      items = MenuItem.where category: params[:category]
    end
    render json: { menu_items: items }
  end
end