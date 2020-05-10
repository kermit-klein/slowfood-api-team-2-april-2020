# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::OrdersController, type: :request do
  let(:food1) { create(:menu_item) }
  let(:food2) { create(:menu_item, name: 'Corn') }
  let(:user) { create(:user) }

  describe 'PUT /api/v1/order, adding user' do
    before do
      post '/api/v1/orders', params: { menu_item: food1.id }
      @order_id = response_json['order']['id']
      put "/api/v1/orders/#{@order_id}", params: { activity: "login", user: user.id }
    end
    
    it 'responds with 200 ok' do
      expect(response).to have_http_status 200
    end

    it 'gives back a success message' do
      expect(response_json["message"]).to eq "User added to order"
    end

    it 'now has the user on the order' do
      expect(Order.last.user_id).to eq user.id
    end
  end
end