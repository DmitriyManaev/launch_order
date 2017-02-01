require 'rails_helper'

describe 'User' do
  context 'created' do
    let(:admin) { create(:admin) }
    let(:user) { create(:user) }
    
    it 'with appropriate role' do
      expect(admin.role.name).to eq("Admin")
      expect(user.role.name).to eq("User")
      
      expect(admin.admin?).to eq(true)
      expect(admin.user?).to eq(false)

      expect(user.user?).to eq(true)
      expect(user.admin?).to eq(false)  
    end
  end

end
