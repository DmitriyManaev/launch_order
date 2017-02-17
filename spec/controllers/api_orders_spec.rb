require 'rails_helper'

describe ApiOrdersController do

  describe 'GET index' do
    let(:first_course) { create(:first_course) }
    let(:main_course) { create(:main_course) }
    let(:drink) { create(:drink) }
    let(:daily_menu) { create(:daily_menu) }
    let(:user) { create(:user) }
   
    before do
      order = Order.create( user_id: user.id, 
                            first_course_id: first_course.id,
                            main_course_id: main_course.id,
                            drink_id: drink.id,
                            date: daily_menu.date,
                            total_cost: first_course.price + main_course.price + drink.price 
                          )
    end

    context 'correct access token' do
      it 'renders template' do
        get :index, access_token: "#{user.access_token}"
        
        expect(response).to have_http_status(:ok)
        
        json = JSON.parse(response.body)
        
        expect(json[0]["user_name"]).to eq("Username")
      end
    end
    

    context 'incorrect access token' do
      it 'returns :unathorized' do
        get :index, %{{ "access": "#{user.access_token}" }}, { format: :json }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

end