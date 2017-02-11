require 'rails_helper'

RSpec.describe MenuItem, type: :model do

  describe 'validations' do
    let(:menu_item) { create(:menu_item) }

    it 'presence of course' do 
      menu_item.course_id = nil
      expect(menu_item).not_to be_valid
    end

    it 'presence of daily menu' do
      menu_item.daily_menu = nil
      expect(menu_item).not_to be_valid
    end
  end

  describe 'belongs to' do
    let(:daily_menu) { create(:daily_menu) }
    let(:course) { create(:course) }
    
    before :each do
      daily_menu.courses << course
    end

    it 'daily menu with dependence destroy' do
      expect(MenuItem.count).to eq 1

      daily_menu.destroy
      expect(MenuItem.count).to eq 0
    end

    it 'course with dependence destroy' do
      expect(MenuItem.count).to eq 1 

      course.destroy
      expect(MenuItem.count).to eq 0
    end
  end
end