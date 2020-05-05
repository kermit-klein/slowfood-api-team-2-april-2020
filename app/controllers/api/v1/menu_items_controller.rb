class Api::V1::MenuItemsController < ApplicationController
	def index
		items = MenuItem.all
		render json: { items: items }
	end
end