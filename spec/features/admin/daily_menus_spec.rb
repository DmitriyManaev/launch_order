require 'rails_helper'

describe "Daily menu" do
  let(:admin) { create(:admin) }

  before do
    login_as admin
  end

  describe 'add menu for today' do
    it 'successfully' do
      visit admin_daily_menus_path
      click_button "Create menu for today"

      expect(page).to have_content("Daily menu added successfully.")
    end
  end

  describe 'course' do
    it 'present in courses list for daily menu' do
      course = create(:course)
      daily_menu = create(:daily_menu)

      visit admin_daily_menus_path
      
      expect(page).to have_content("#{course.name}")
    end
  end
  
  describe 'menu item' do
    before do
      course = create(:course)
      daily_menu = create(:daily_menu)
      visit admin_daily_menus_path
      click_button 'Add to menu'
    end

    describe 'add to menu' do
      it 'with success message' do
        expect(page).to have_content("Item added to menu successfully.")
      end
    end

    describe 'del from menu' do
      it 'with success message' do
        find("#daily_menu").click_link "Delete"
        
        expect(page).to have_content("Item deleted from menu.")
      end
    end
  end    
end