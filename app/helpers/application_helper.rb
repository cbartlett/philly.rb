# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def action_body_id
    return @action_body_id || "#{params[:controller].gsub(/admin\//, 'admin_')+'_'+params[:action]}"
  end

  # Takes 2 DateTime's and returns a date range text string
  # that reads nice. It doesn't repeat the date if the days
  # are the same.
  def time_range(date1, date2)
    output = date1.to_s(:nice)
    output += " - "
    if date1.beginning_of_day == date2.beginning_of_day
      output += date2.strftime("%I:%M %p")
    else
      output += date2.to_s(:nice)
    end
    return output
  end

  def google_groups
    'http://groups.google.com/group/phillyrb'
  end

  def twitter_name
    'phillyrb'
  end

  def twitter
    "http://twitter.com/#{twitter_name}"
  end
end
