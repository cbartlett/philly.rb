class EventsController < ApplicationController
  # GET /events
  # GET /events.xml
  def index
    @events = Event.upcoming

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
      format.ics do
        @cal = Icalendar::Calendar.new
        @events.each { |e| @cal.add(e.to_ical) }
        render :text => @cal.to_ical
      end
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end
end