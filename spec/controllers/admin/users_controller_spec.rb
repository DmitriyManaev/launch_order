require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  let(:admin) { create(:admin) }
    
  before do
    sign_in admin
  end

  describe 'GET index' do
    it 'render index template' do
      user = create(:user)
      
      get :index
      
      expect(response).to render_template(:index)      
    end
  end

end