require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  
  describe 'POST create' do
    let(:first_course) { create(:first_course) }
    let(:main_course) { create(:main_course) }
    let(:drink) { create(:drink) }
    let(:user) { create(:user) }

    before do
      sign_in user
    end

    it 'redirect to root' do
      post :create, order: { first_course_id: first_course.id,
                             main_course_id: main_course.id,
                             drink_id: drink.id
                            }

      expect(response).to redirect_to(:root)
    end

    it 'create order' do
      expect do
        post :create, order: { first_course_id: first_course.id,
                               main_course_id: main_course.id,
                               drink_id: drink.id
                              }

      end.to change{Order.count}.from(0).to(1)
    end
  end

end