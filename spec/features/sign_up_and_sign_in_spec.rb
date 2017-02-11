require 'rails_helper'

describe 'Sign up' do
  context 'no logged' do

    it "successful sign up" do
      user = build(:user)
      
      visit root_path
      
      expect(page).to have_content("You need to sign in or sign up before continuing.")
      
      click_link 'Sign up'
      
      fill_in 'Name', with: user.name
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password_confirmation
      click_button 'Sign up'
      
      expect(page).to have_content("Welcome! You have signed up successfully.")
    end
    
    it "successful sign in" do
      user = create(:user)

      visit root_path
      
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      
      expect(page).to have_content("Signed in successfully.")
    end
  end 
end