require 'rails_helper'

describe "Courses" do
  let(:admin) { create(:admin) }

  before do
    login_as admin
  end

  describe 'add new course' do
    let(:course) { build(:course) }
    
    before do
      visit new_admin_course_path
    end

    context 'with valid params' do 
      it 'course added successfully' do
        fill_in 'Name', with: course.name
        fill_in 'Price', with: course.price
        click_button 'Submit'

        expect(page).to have_content("Course added successfully!")
      end
    end

    context 'with invalid params' do 
      it 'course not added' do
        fill_in 'Name', with: course.name
        fill_in 'Price', with: ""
        click_button 'Submit'

        expect(page).to have_content("Course not added!")
      end
    end
  end

  describe 'in courses list' do
    it 'presents' do
      course = create(:course)

      visit admin_courses_path

      expect(page).to have_content("#{course.name}")
    end

    describe 'edit course' do
      let(:course) { create(:course) }

      before do
        course.save
        visit admin_courses_path
        click_link 'Edit'
      end

      describe 'with valid params' do
        it 'updated successfully' do
          fill_in "course_price", with: 12
          click_button 'Submit'

          expect(page).to have_content("Course updated.")
        end  
      end

      describe 'with invalid params' do
        it 'not updated' do
          fill_in "course_price", with: 0
          click_button 'Submit'

          expect(page).to have_content("Course not updated. Check course params.")
        end  
      end
    end
  end
end 