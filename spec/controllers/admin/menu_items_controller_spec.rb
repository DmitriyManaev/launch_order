require 'rails_helper'

RSpec.describe Admin::MenuItemsController, type: :controller do
  let(:admin) { create(:admin) }
    
  before do
    sign_in admin
  end

  describe 'create menu item' do

    it 'redirect to admin daily menus path' do
      post :create, menu_item: attributes_for(:menu_item)
      
      expect(response).to redirect_to(admin_daily_menus_path)   
    end

    describe 'with valid params' do
      it 'creates new menu item' do
        expect{
          post :create, menu_item: attributes_for(:menu_item)
        }.to change(MenuItem, :count).by(1)  
      end

      it 'return success message' do
        post :create, menu_item: attributes_for(:menu_item)
        
        expect(flash[:success]).to have_content("Item added to menu successfully.") 
      end
    end
      
    describe 'with invalid params' do
      it 'return fail message' do
        menu_item_params = attributes_for(:menu_item)
        menu_item_params[:course_id] = ''

        post :create, menu_item: menu_item_params
        
        expect(flash[:fail]).to have_content("Item not added!")
      end    
    end
  end
end