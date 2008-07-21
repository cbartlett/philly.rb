require File.dirname(__FILE__) + '/../spec_helper'

describe EventCategory do
  it "should require a name" do
    category = EventCategory.new(valid_event_category_attributes.except(:name))
    category.should_not be_valid
  end
end

describe "EventCategory#upcoming" do
  it "should return the next event when there's 2 in the future" do
    category = EventCategory.create(valid_event_category_attributes)
    category.events.create(valid_event_attributes(:name => 'yes', :event_category_id => category.id, :starts_at => Time.now+500))
    category.events.create(valid_event_attributes(:name => 'no',  :event_category_id => category.id, :starts_at => Time.now+1000))
    category.upcoming_event.name.should eql('yes')
  end
  
  it "should return the next event when there's 1 in the past and 1 in the future" do
    category = EventCategory.create(valid_event_category_attributes)
    category.events.create(valid_event_attributes(:name => 'no', :event_category_id => category.id, :starts_at => Time.now-1000))
    category.events.create(valid_event_attributes(:name => 'yes',  :event_category_id => category.id, :starts_at => Time.now+1000))
    category.upcoming_event.name.should eql('yes')
  end
end
