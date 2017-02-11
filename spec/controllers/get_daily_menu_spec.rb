require 'rails_helper'
include ApplicationHelper

describe GetDailyMenusController do

  describe 'GET index' do
    let(:first_course) { create(:first_course) }
    let(:main_course) { create(:main_course) }
    let(:drink) { create(:drink) }
    let(:daily_menu) { create(:daily_menu) }
    let(:user) { create(:user) }
    
    before do
      daily_menu.courses << [ first_course, main_course, drink ]
      sign_in user
    end

    it 'render partial daily_menu_items' do
      get :index, date: today_date.strftime('%d/%m/%Y')
      
      expect(response).to render_template(partial: "_daily_menu_items")      
    end  

    describe 'if nothing to return' do
      it 'render nothing' do
        get :index, date: (today_date - 1.day).strftime('%d/%m/%Y') 
        
        expect(response.body).to include("Not Found")      
      end  
    end  
  end

end