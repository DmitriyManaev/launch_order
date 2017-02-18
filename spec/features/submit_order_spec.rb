require 'rails_helper'

describe 'Submit order' do
  it 'with success message', js: true do
    user = create(:user)
    login_as user
    first_course = create(:first_course)
    main_course = create(:main_course)
    drink = create(:drink)
    daily_menu = create(:daily_menu)
    daily_menu.courses << [ first_course, main_course, drink ]

    visit root_path

    within('#first_course_items') do 
      find_button("Add to order").trigger('click')
    end
    
    within('#main_course_items') do 
      find_button("Add to order").trigger('click')
    end

    within('#drink_items') do 
      find_button("Add to order").trigger('click')
    end

    find(".form").click_button 'Submit'

    expect(page).to have_content("Order added successfully!")
  end
end