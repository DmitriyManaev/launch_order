require 'rails_helper'

describe User do
  describe 'created' do
    before :each do
      Role.create(name: "Admin", description: "Admin abilities")
      Role.create(name: "User", description: "User abilities")

      @user = User.new(name: "Username", 
                      email: "username@gmail.com", 
                      password: "password",
                      password_confirmation: "password", 
                      role_id: "")
    end
    
    context 'first registered user' do

      it 'becomes admin' do
        @user.save
        expect(User.count).to eq(1)
        expect(@user.admin?).to eq(true)
      end  

    end

    context 'second registered user' do

      it 'becomes user' do
        User.create(name: "Admin", 
                    email: "admin@gmail.com", 
                    password: "passw0rd",
                    password_confirmation: "passw0rd", 
                    role_id: "")
  
        @user.save
        expect(User.count).to eq(2)
        expect(@user.user?).to eq(true)
      end  

    end
  end
end
