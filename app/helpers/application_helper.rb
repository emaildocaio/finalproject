module ApplicationHelper
  def beautiful_date_helper(date_string)
    return nil if date_string.nil?
    date = Date.parse(date_string)
    date.strftime("%B %e, %Y")
  end
end
