require 'rails_helper'

RSpec.describe Admin::DailyMenusController, type: :controller do
  let(:admin) { create(:admin) }
    
  before do
    sign_in admin
  end

  describe 'GET index' do
    it 'render index template' do
      get :index
      
      expect(response).to render_template(:index)      
    end
  end

  describe 'create daily menu' do
    it 'redirects to admin daily menus path' do
      post :create
       
      expect(response).to redirect_to(admin_daily_menus_path)   
    end

    describe 'when menu does not exist today' do
      it 'creates menu' do
        expect{
          post :create
        }.to change(DailyMenu, :count).by(1)  
      end

      it 'return success message' do
        post :create
        
        expect(flash[:success]).to have_content("Daily menu added successfully.")
        expect(response).to redirect_to(admin_daily_menus_path)   
      end
    end
      
    describe 'when menu exist today' do
      it 'return fail message' do
        create(:daily_menu)
        
        post :create
        
        expect(flash[:fail]).to have_content("Daily menu not added!") 
      end    
    end
  end
end