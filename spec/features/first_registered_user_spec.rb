require 'rails_helper'

describe 'User' do
  context 'no logged' do

    it 'need to sign in' do
      visit root_path
      expect(page).to have_content("You need to sign in or sign up before continuing.")
    end

    it 'if he log in as admin' do
      admin = create(:admin)     
      login_as admin

      visit root_path
      
      expect(admin.role.name).to eq("Admin")
      expect(page).to have_content("Admin panel")
    end
    
    it 'if he log in as user' do
      user = create(:user)

      sign_in user
      visit root_path

      expect(user.role.name).to eq("User")
      expect(page).not_to have_content("Admin panel")
    end

  end
 
end