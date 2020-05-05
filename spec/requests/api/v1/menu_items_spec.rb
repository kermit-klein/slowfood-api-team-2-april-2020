require 'rails_helper'

RSpec.describe API::V1::MenuItemsController, type: :request do
    describe 'GET /v1/menu_items' do
        before do
            get 'api/v1/menu_items'
        end

        it 'should return a 200 response' do
            expect(response).to have_http_status 200
        end

        describe 'should return a response with' do
            before do
                json_response = JSON.parse(response.body)
            end

            it 'should return a list of menu items' do
                expect(json_response.length).to eq 3
            end

            it 'should return items with a name' do
                expect(json_response[0][:name]).to eq 'Pickled egg'
            end
        end
    end
end