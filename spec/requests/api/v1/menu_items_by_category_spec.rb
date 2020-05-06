require 'rails_helper'

RSpec.describe Api::V1::MenuItemsController, type: :request do
  let!(:menu_items) { 3.times { create(:menu_item) } }
  let!(:menu_items2) { 3.times { create(:menu_item, category: "Dessert") } }

  describe 'gets items from a single category' do
    before do
      get '/api/v1/menu_items', params: { category: "Dessert"}
    end

    it 'gets only the Dessert items' do
      expect(response_json["menu_items"].length).to eq 3
    end

    it 'all items have the desired category' do
      response_json["menu_items"].each { |menu_item|
        expect(menu_item["category"]).to eq "Dessert"
      }
    end
  end
end
