# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def action_body_id
    return @action_body_id || "#{params[:controller].gsub(/admin\//, 'admin_')+'_'+params[:action]}"
  end
end
