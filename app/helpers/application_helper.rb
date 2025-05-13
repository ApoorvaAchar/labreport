module ApplicationHelper
	
  def datetime_format(date)
    return "" if date.blank?
    date.strftime("%d-%m-%Y %I:%M %p")
  end

end
