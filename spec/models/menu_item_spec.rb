require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  describe 'Database table' do
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :description }
    it { is_expected.to have_db_column :price }
    it { is_expected.to have_db_column :category}
  end

  describe 'Validation' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :price }
    it { is_expected.to validate_presence_of :category }
  end

  describe 'Factory' do
    it "should have a valid factory" do
      expect(create(:menu_item)).to be_valid
    end
  end
end
