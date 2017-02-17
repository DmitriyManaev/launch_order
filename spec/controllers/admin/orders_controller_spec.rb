require 'rails_helper'

RSpec.describe Admin::OrdersController, type: :controller do
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

  describe 'destroy order' do
    describe 'order exists' do
      let(:order) { create(:order) }
        
      it 'order destroyed' do
        order.save

        expect{ 
          delete :destroy, id: order.id
        }.to change(Order, :count).from(1).to(0)
      end

      it 'redirect to admin orders path' do
        delete :destroy, id: order.id

        expect(response).to redirect_to(admin_orders_path)
      end

      it 'return success message' do
        delete :destroy, id: order.id

        expect(flash[:success]).to have_content("Order destroyed.")
      end
    end
  end
end