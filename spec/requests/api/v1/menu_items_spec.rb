require 'rails_helper'

RSpec.describe Api::V1::MenuItemsController, type: :request do
  let!(:menu_items) { 3.times { create(:menu_item) } }
    describe 'GET /v1/menu_items' do
        before do
            get '/api/v1/menu_items'
        end

        it 'should return a 200 response' do
            expect(response).to have_http_status 200
        end

        it 'should return a list of menu items' do
            expect(response_json["menu_items"].length).to eq 3
        end

        it 'should return items with a name' do
            expect(response_json["menu_items"][0]).to have_key('name')
        end

        it 'should return items with a price' do
            expect(response_json["menu_items"][0]).to have_key('price')
        end
    end
end