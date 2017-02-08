require 'rails_helper'

describe 'Ability' do
  context 'if log in as admin' do

    it 'displays Admin panel' do
      admin = create(:admin)     
      login_as admin

      visit root_path
      
      expect(page).to have_content("Admin panel")
    end
  end

  context 'if log in as user' do   
    it 'not displays Admin panel' do
      user = create(:user)

      sign_in user
      visit root_path

      expect(page).not_to have_content("Admin panel")
    end
  end
 
end