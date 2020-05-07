require 'rails_helper'

RSpec.describe Api::V1::OrdersController, type: :request do
  let(:food1) { create(:menu_item)}
  let(:food2) { create(:menu_item, name: "Corn")}
  let(:user) { create(:user)}

  describe 'POST /api/v1/order, without user' do
    before do
      post '/api/v1/orders', params: { menu_item: food1.id }
    end

    it 'responds with a 200 status' do
      expect(response).to have_http_status 200
    end

    it 'has a success message' do
      expect(response_json["message"]).to eq "Item added to order"
    end

    it 'returns the opened order id' do
      expect(response_json).to have_key('id')
    end

    it 'has the first item in it' do
      expect(Order.last.order_items[0]["menu_item_id"]).to eq food1.id
    end
  end

  describe 'POST /api/v1/order, with user' do
    before do
      post '/api/v1/orders', params: { menu_item: food1.id, user: user.id }
    end

    it ' belongs to user' do
      expect(Order.last["user_id"]).to eq user.id
    end
  end
end
