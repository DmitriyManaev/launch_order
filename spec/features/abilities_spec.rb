require 'rails_helper'

describe 'Ability' do
  context 'if log in as admin' do

    it 'displays Admin panel' do
      admin = create(:admin)     
      login_as admin

      visit admin_path
      
      expect(page).to have_content("Admin")
    end
  end

  context 'if log in as user' do  
    it 'displays daily menu' do
      user = create(:user)

      sign_in user
      visit admin_path

      expect(page).to have_content("Access denied!")
      expect(page).to have_content("Daily menu for")
    end
  end
 
end