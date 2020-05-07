require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe 'Relations' do
    it { is_expected.to belong_to :order }
    it { is_expected.to belong_to :menu_item }
  end
end
