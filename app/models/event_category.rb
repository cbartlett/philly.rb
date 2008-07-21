class EventCategory < ActiveRecord::Base

  validates_presence_of :name
  has_many :events

  def upcoming_event
    Event.find(:first,
               :conditions => ["starts_at > ? and event_category_id = ?", Time.now.utc, id],
               :order => "starts_at")
  end
end
