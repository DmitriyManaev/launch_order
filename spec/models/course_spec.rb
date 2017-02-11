require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'course_types method' do
    it 'return valid types' do
      expect(Course.course_types).to eq(['first course', 'main course', 'drink'])
    end
  end

  describe 'validations' do
    let(:course) { create(:course) }

    it 'presence of name' do 
      course.name = nil
      expect(course).not_to be_valid
    end

    it 'presence of price' do
      course.price = nil
      expect(course).not_to be_valid
    end

    it 'presence of course_type' do
      course.course_type = nil
      expect(course).not_to be_valid
    end

    it 'numericality of price' do
      course.price = "qwerty"
      expect(course).not_to be_valid
    end

  end

  describe 'scope by_type' do
    let(:first_course) { create(:first_course) }
    let(:drink) { create(:drink) }

    it 'returns only appropriate courses' do 
      courses = Course.by_type("first course")
      
      expect(courses).to include(first_course)
      expect(courses).not_to include(drink)
    end

  end
end
