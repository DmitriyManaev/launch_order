require 'rails_helper'
include ApplicationHelper

RSpec.describe DailyMenu, type: :model do

  it 'validates the uniqueness of date' do
    daily_menu = create(:daily_menu)

    expect(DailyMenu.count).to eq 1
    expect{DailyMenu.create!()}.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Date has already been taken') 
  end

  it 'sets the date today before validation' do
    daily_menu = DailyMenu.new
    
    expect(daily_menu.date).to be_nil

    daily_menu.save!

    expect(daily_menu.date).to eq(today_date)
  end
end
