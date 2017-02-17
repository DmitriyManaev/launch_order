require 'rails_helper'

RSpec.describe Admin::AdminController, type: :controller do
  describe 'GET index' do
    let(:admin) { create(:admin)}

    it 'render index template' do
      sign_in admin
      get :index
      
      expect(response).to render_template(:index)      
    end

  end
end