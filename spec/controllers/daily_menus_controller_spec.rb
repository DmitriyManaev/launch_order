require 'rails_helper'

RSpec.describe DailyMenusController, type: :controller do
  describe 'GET index' do
    let(:user) { create(:user)}

    it 'render index template' do
      sign_in user
      get :index
      
      expect(response).to render_template(:index)      
    end

  end

end
