module ApplicationHelper
  def placeholder_dates_helper(params, index)
    return nil if params[:search].nil?

    if params[:search][:start_date].empty?
      nil
    else
      dates = params[:search][:start_date].split(" ")
      dates[index]
    end
  end
end
