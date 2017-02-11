require 'rails_helper'

describe 'User' do
  context 'edit profile' do
    it 'accaunt updated successfully' do
      user = create(:user)
      login_as user
      visit root_path
      click_link 'Edit profile'

      fill_in 'Name', with: user.name
      fill_in 'Email', with: user.email
      fill_in 'Password', with: "newpassword"
      fill_in 'Password confirmation', with: "newpassword"
      fill_in 'Current password', with: user.password
      
      click_button 'Update'
      
      expect(page).to have_content("Your account has been updated successfully.")
    end
  end
end