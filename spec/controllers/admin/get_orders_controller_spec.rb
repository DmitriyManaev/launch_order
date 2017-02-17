require 'rails_helper'

RSpec.describe Admin::GetOrdersController, type: :controller do
  let(:admin) { create(:admin) }
    
  before do
    sign_in admin
  end
  
  describe 'GET index' do
    describe 'orders exists' do
      it 'render partial with order items' do
        order = create(:order)
        
        get :index, date: order.date.strftime('%d/%m/%Y') 
        
        expect(response).to render_template("_order_items")      
      end
    end

    describe 'orders not exists' do
      it 'render not found' do
        daily_menu = create(:daily_menu)

        get :index, date: daily_menu.date.strftime('%d/%m/%Y') 
        
        expect(response.body).to have_content("Not Found")      
      end
    end
  end
end