require 'rails_helper'

describe 'User' do
  context 'submit order' do

    it 'accaunt updated successfully' do

      create(:daily_menu) do |menu|
        menu.courses.create(name: "soup", price: "10", course_type: "first course")
        menu.courses.create(name: "plov", price: "20", course_type: "main course")
        menu.courses.create(name: "tea", price: "30", course_type: "drink")
      end

      user = create(:user)
      login_as user
      visit root_path
      expect(page).to have_content("fuck!")
      
      click_button 'Submit'

      expect(page).to have_content("Order added successfully!")
    end
  end
end