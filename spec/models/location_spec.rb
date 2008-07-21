require File.dirname(__FILE__) + '/../spec_helper'

describe Location do
  it "should require a name" do
    Location.new(valid_location_attributes.except(:name)).should_not be_valid
  end
  
  it "should require an address line 1" do
    Location.new(valid_location_attributes.except(:address_1)).should_not be_valid
  end
  
  it "should require a city" do
    Location.new(valid_location_attributes.except(:city)).should_not be_valid
  end
  
  it "should require a state" do
    Location.new(valid_location_attributes.except(:state)).should_not be_valid
  end
  
  it "should require a zip" do
    Location.new(valid_location_attributes.except(:zip)).should_not be_valid
  end
  
end
