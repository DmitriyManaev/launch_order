require 'rails_helper'

describe "Orders" do
  let(:admin) { create(:admin) }

  before do
    login_as admin
    first_course = create(:first_course)
    main_course = create(:main_course)
    drink = create(:drink)
    @order = build(:order)

    @order.first_course_id = first_course.id
    @order.main_course_id = main_course.id
    @order.drink_id = drink.id
    @order.save

    visit admin_orders_path
  end

  it 'present in orders list' do
    expect(page).to have_content("#{@order.total_cost}")
  end

  it 'present total cost' do
    expect(find("#totalCost")).to have_content("#{@order.total_cost}")
  end

  it 'deleted with success message' do
    find("#order_items").click_link "Delete"

    expect(page).to have_content("Order destroyed.")
  end 

  describe 'get yesterday order' do
    before do
      @order.date = @order.date - 1.day
      @order.save

      visit admin_orders_path
    end

    it 'not found for today orders list' do
      expect(find("#order_items")).not_to have_content("#{@order.total_cost}")
    end

    it 'found on yesterday orders list', js: true do
      page.execute_script("$('#datepicker_order').datepicker('setDate', '#{@order.date.strftime('%d/%m/%Y')}')")
      page.execute_script("$('#getOrders').click()")

      expect(find("#date")).to have_content("#{@order.date.strftime('%d/%m/%Y')}")
      expect(find("#order_items")).to have_content("#{@order.total_cost}")
    end
  end
end