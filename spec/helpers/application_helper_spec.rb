require File.dirname(__FILE__) + '/../spec_helper'

describe ApplicationHelper do
  include ApplicationHelper
  
  describe "time_range" do
    it "should return a time range when the days are the same" do
      date1 = DateTime.civil(2008,8,22,7,30)
      date2 = DateTime.civil(2008,8,22,8,30)
      time_range(date1, date2).should eql('August 22, 2008 07:30 AM - 08:30 AM')
    end
  
    it "should return the date range, too, when the days are different" do
      date1 = DateTime.civil(2008,8,22,7,30)
      date2 = DateTime.civil(2008,9,22,8,30)
      time_range(date1, date2).should eql('August 22, 2008 07:30 AM - September 22, 2008 08:30 AM')    
    end
  end
end
