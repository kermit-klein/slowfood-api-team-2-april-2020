# frozen_string_literal: true

RSpec.describe Api::V1::OrdersController, type: :request do
  let(:food1) { create(:menu_item, name: 'Pizza', price: 10) }
  let(:food2) { create(:menu_item, name: 'Kebab', price: 20) }
  let(:order) { create(:order) }
  let(:order2) { create(:order, user: create(:user)) }

  before do
    order.order_items.create(menu_item: food1)
    order.order_items.create(menu_item: food2)
    order2.order_items.create(menu_item: food1)
    order2.order_items.create(menu_item: food2)
  end

  describe 'PUT /api/v1/orders for no user' do
    before do
      put "/api/v1/orders/#{order.id}", params: { activity: 'finalize' }
    end

    it 'responds with success message' do
      expect(JSON.parse(response.body)['message']).to eq 'You need to be logged in'
    end

    it 'the order attribute "finalized" does not change' do
      expect(order.reload.finalized).to eq false
    end
  end

  describe 'PUT /api/v1/orders for user' do
    before do
      put "/api/v1/orders/#{order2.id}", params: { activity: 'finalize' }
    end

    it 'responds with success message' do
      expect(JSON.parse(response.body)['message']).to eq 'Your order will be ready in 30 minutes!'
    end

    it 'sets the order attribute "finalized" to true' do
      expect(order2.reload.finalized).to eq true
    end
  end
end
