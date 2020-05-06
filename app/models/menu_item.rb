class MenuItem < ApplicationRecord
  enum category: [:starter, :main_course, :dessert, :drinks, :extras]
	validates_presence_of :name, :price, :category
end