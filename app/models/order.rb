# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :order_items

  def order_total
    order_items.joins(:menu_item).sum('menu_items.price')
  end
end
