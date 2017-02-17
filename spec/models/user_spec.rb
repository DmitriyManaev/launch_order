require 'rails_helper'

describe User do
  describe 'created' do
    before do
      create(:role)
      create(:role_admin)
    end

    let(:user) { build(:user) }

    context 'first registered user' do

      it 'becomes admin' do
        user.role = nil
        user.save
        
        expect(User.count).to eq(1)
        expect(user.admin?).to eq(true)
      end  

    end

    context 'second registered user' do

      it 'becomes user' do
        admin = create(:admin)
        user.save

        expect(User.count).to eq(2)
        expect(user.user?).to eq(true)
      end  

    end
  end
end