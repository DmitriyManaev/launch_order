require 'rails_helper'

describe 'User' do
  context 'submit order' do
    let(:first_course) { create(:first_course) }
    let(:main_course) { create(:main_course) }
    let(:drink) { create(:drink) }
    let(:daily_menu) { create(:daily_menu) }

    it 'accaunt updated successfully' do
      daily_menu.courses << [ first_course, main_course, drink ]

      user = create(:user)
      login_as user
      visit root_path
      
      click_button 'Submit'

      expect(page).to have_content("Order added successfully!")
    end
  end
end