require 'rails_helper'

RSpec.describe Api::V1::MenuItemsController, type: :request do
    let!(:food1) { create(:menu_item, name: 'Pickled Egg', description: 'An egg that is in a reeeeal pickle!', price: 69) }
    let!(:food2) { create(:menu_item, name: 'Bread', description: 'Simply bread', price: 25) }
    let!(:food3) { create(:menu_item, name: 'Ham Sandwich', description: 'No, not hamBURGER, ham SANDWICH', price: 42) }

    describe 'GET /v1/menu_items' do
        before do
            get '/api/v1/menu_items'
        end

        it 'should return a 200 response' do
            expect(response).to have_http_status 200
        end

        describe 'should return a response with' do
            let(:json_response) { JSON.parse(response.body) }

            it 'should return a list of menu items' do
                expect(json_response["items"].length).to eq 3
            end

            it 'should return items with a name' do
                expect(json_response["items"][0]["name"]).to eq food1.name
            end

            it 'should return items with a price' do
                expect(json_response["items"][0]["price"]).to eq food1.price
            end
        end
    end
end