require 'rails_helper'

RSpec.describe Admin::CoursesController, type: :controller do
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

  describe 'GET new' do
    it 'render new template' do
      get :new
      
      expect(response).to render_template(:new)   
    end
  end

  describe 'create course' do
    describe 'with valid params' do
      it 'creates new course' do
        expect{
          post :create, course: attributes_for(:course)
        }.to change(Course, :count).by(1)  
      end

      it 'redirects to admin cources path' do
        post :create, course: attributes_for(:course)
        
        expect(response).to redirect_to(admin_courses_path)   
      end

      it 'return success message' do
        post :create, course: attributes_for(:course)
        
        expect(flash[:success]).to have_content("Course added successfully!") 
      end
    end
      
    describe 'with invalid params' do
      it 'render template new' do
        course_params = attributes_for(:course)
        course_params[:name] = ''

        post :create, course: course_params
        
        expect(response).to render_template(:new) 
      end    
    end
  end

  describe 'GET edit' do
    it 'render new template' do
      course = create(:course)
      
      get :edit, id: course
      
      expect(response).to render_template(:edit)   
    end
  end

  describe 'update course' do
    let(:course) { create(:course) }

    describe 'with valid params' do
      it 'redirect to admin courses path' do
        patch :update, id: course, course: attributes_for(:course)
              
        expect(response).to redirect_to(admin_courses_path)   
      end
      
      it 'return success message' do
        patch :update, id: course, course: attributes_for(:course)
        
        expect(flash[:success]).to have_content("Course updated.")        
      end
    end

    describe 'with invalid params' do
      before do 
        @course_params = attributes_for(:course)
        @course_params[:name] = ''
      end

      it 'render edit template' do
        patch :update, id: course, course: @course_params
             
        expect(response).to render_template(:edit)   
      end

      it 'return fail message' do
        patch :update, id: course, course: @course_params
        
        expect(flash[:fail]).to have_content("Course not updated. Check course params.")      
      end
    end 
  end 
end