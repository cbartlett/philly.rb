class AdministrativeController < ApplicationController
  layout "admin"
  before_filter :authenticate

  private
    def authenticate  
      authenticate_or_request_with_http_basic do |username, password|
        return true if username == APP_CONFIG[:username] && password == APP_CONFIG[:password]
      end if APP_CONFIG[:protect_admin_site]
    end
end
