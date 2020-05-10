# frozen_string_literal: true

class OrderSerializer < ActiveModel::Serializer
  attributes :id, :menu_items, :total, :order_total, :finalized

  def menu_items
    object.order_items.group_by(&:menu_item_id).map do |_key, value|
      menu_item = value.uniq(&:menu_item_id)[0].menu_item
      { amount: value.size, name: menu_item.name, total: (value.size * menu_item.price) }
    end
  end

  def total
    object.order_items.joins(:menu_item).sum('menu_items.price')
  end
end
