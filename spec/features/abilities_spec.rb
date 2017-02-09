require 'rails_helper'

describe 'Ability' do
  context 'if log in as admin' do

    it 'displays Admin panel' do
      admin = create(:admin)     
      login_as admin

      visit rails_admin_path
      
      expect(page).to have_content("Admin")
    end
  end

  context 'if log in as user' do   
    it 'not displays Admin panel' do
      user = create(:user)

      sign_in user
      visit rails_admin_path

      expect(page).not_to have_content("Admin")
      expect(page).to have_content("Access denied!")
      expect(page).to have_content("Daily menu for")
    end
  end
 
end