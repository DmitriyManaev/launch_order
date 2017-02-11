require 'rails_helper'
include ApplicationHelper

RSpec.describe Order, type: :model do

  describe 'presence validations' do
    let(:order) { build(:order) }

    it 'first course' do
      order.first_course_id = nil
      expect(order).not_to be_valid
    end

    it 'main course' do
      order.main_course_id = nil
      expect(order).not_to be_valid
    end

    it 'drink' do
      order.drink_id = nil
      expect(order).not_to be_valid
    end

    it 'user id' do
      order.user_id = nil
      expect(order).not_to be_valid
    end

    it 'total cost' do
      order.total_cost = nil
      expect(order).not_to be_valid
    end

    it 'date' do
      order.date = nil
      expect(order).not_to be_valid
    end
  end

  describe 'scope for_day' do
    let(:user) { create(:user) }
    let!(:order) { create(:order) }

    let(:new_user) { create(:user, email: 'new_user@gmail.com') }
    let!(:yesterdays_order) { create(:order, user: new_user, date: today_date - 1.day) }

    it 'return order only for today' do
      expect(Order.for_day(today_date).count).to eq(1)
    end
  end
end
