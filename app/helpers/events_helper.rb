module EventsHelper
  def gmap url
    h "#{url}&size=240x200&sensor=false&#{APP_CONFIG[:gmap_key]}"
  end
end
