require 'rails_helper'

describe "Daily menus" do
  let(:user) { create(:user) }

  before do
    login_as user
    visit root_path
  end

  describe 'get yesterday menu' do     
    it 'found on yesterday orders list', js: true do
      first_course = create(:first_course)
      main_course = create(:main_course)
      drink = create(:drink)
      daily_menu = create(:daily_menu)
      
      yesterday_menu = daily_menu
      yesterday_menu.courses << [ first_course, main_course, drink ]
      yesterday_menu.date = yesterday_menu.date - 1.day
      yesterday_menu.save
      
      page.execute_script("$('#datepicker_menu').datepicker('setDate', '#{yesterday_menu.date.strftime('%d/%m/%Y')}')")
      page.execute_script("$('#getMenu').click()")
      
      expect(find("#daily_menu_date")).to have_content(yesterday_menu.date.strftime('%d/%m/%Y'))
      expect(find("#daily_menu_items")).to have_content("#{first_course.name}")
    end
  end
end