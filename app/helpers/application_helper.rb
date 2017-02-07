module ApplicationHelper
  def today_date
    DateTime.now.in_time_zone(Time.zone).beginning_of_day 
  end
end
