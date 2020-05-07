require 'rails_helper'

RSpec.describe Api::V1::OrdersController, type: :request do
  let(:food1) { create(:menu_item)}
  let(:food2) { create(:menu_item, name: "Corn")}

  describe 'POST /api/v1/order, =first item' do
    before do
      post '/api/v1/orders', params: { menu_item: food1.id }
    end

    it 'responds with a 200 status' do
      expect(response).to have_http_status 200
    end

    it 'has a success message' do
      expect(response.message).to eq "Item added to order"
    end

    it 'returns the opened order id' do
      expect(response).to have_key('id')
    end
  end

  describe 'PUT /api/v1/order/:id, =further items' do
    before do
      
    end

    it 'responds with a 200 status' do
      skip("TODO")
    end

    it 'responds with a success message' do
      skip("TODO")
    end
  end

  describe 'GET /api/v1/order/:id, fetch the order in its current status' do

  end
end