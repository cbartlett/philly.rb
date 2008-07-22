require File.dirname(__FILE__) + '/../spec_helper'

describe Event do
  it "should require a name" do
    Event.new(valid_event_attributes.except(:name)).should_not be_valid
  end

  it "should require a description" do
    Event.new(valid_event_attributes.except(:description)).should_not be_valid
  end

  it "should require a location" do
    Event.new(valid_event_attributes.except(:location_id)).should_not be_valid
  end

  it "should require a start date/time" do
    Event.new(valid_event_attributes.except(:starts_at)).should_not be_valid
  end

  it "should require an end date/time" do
    Event.new(valid_event_attributes.except(:ends_at)).should_not be_valid
  end

  it "should require a category" do
    Event.new(valid_event_attributes.except(:event_category_id)).should_not be_valid
  end
end

describe "Event#upcoming" do
  it "should return only upcoming events" do
    Event.create(valid_event_attributes(:starts_at => Time.now+1000))
    Event.create(valid_event_attributes(:starts_at => Time.now-1000))
    Event.upcoming.size.should eql(1)
  end
end

describe "Event#to_ical" do
  it "should have an ical event output" do
    event = Event.new(valid_event_attributes)
    event.location = Location.new(valid_location_attributes)
    event.to_ical.class.should eql(Icalendar::Event)
  end
end
