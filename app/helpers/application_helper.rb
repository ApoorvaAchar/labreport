module ApplicationHelper
	
  def datetime_format(date)
    return "" if date.blank?
    date.to_time.strftime("%d-%m-%Y %I:%M %p")
  end

end
