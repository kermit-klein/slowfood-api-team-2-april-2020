# frozen_string_literal: true

RSpec.describe Api::V1::OrdersController, type: :request do
  let(:food1) { create(:menu_item, name: 'Pizza', price: 10) }
  let(:food2) { create(:menu_item, name: 'Kebab', price: 20) }
  let(:order) { create(:order) }

  before do
    order.order_items.create(menu_item: food1)
    order.order_items.create(menu_item: food2)

    put "/api/orders/#{order.id}", params: { activity: 'finalize' }
  end

  describe 'PUT /api/orders' do
    it 'responds with success message' do
      expect(JSON.parse(response.body)['message']).to eq 'Your order will be ready in 30 minutes!'
    end

    it 'sets the order attribute "finalized" to true' do
      expect(order.reload.finalized).to eq true
    end
  end
end
