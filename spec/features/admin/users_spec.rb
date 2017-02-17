require 'rails_helper'

describe "Users" do
  let(:admin) { create(:admin) }
  let(:user) { create(:user) }

  before do
    login_as admin
  end

  it 'course added successfully' do
    user.save
    
    visit admin_users_path

    expect(page).to have_content("Users")
    expect(page).to have_content("#{user.name}")
    expect(page).to have_content("#{user.email}")
  end
end
