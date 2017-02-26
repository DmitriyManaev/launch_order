module ApplicationHelper
  def today_date
    DateTime.now.in_time_zone(Time.zone).beginning_of_day 
  end

  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end
end
