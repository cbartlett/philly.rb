# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'spec'
require 'spec/rails'

Spec::Runner.configure do |config|
  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false
  config.fixture_path = RAILS_ROOT + '/spec/fixtures/'
end

class Hash
  def except(*keys)  
    self.reject { |k,v|  
      keys.include? k.to_sym  
    }  
  end
end

module Kernel
  alias running lambda
end

def valid_location_attributes(attributes={})
  {:name => 'ABC Pub',
   :address_1 => '123 Main St.',
   :address_2 => 'Suite 100',
   :city => 'Anytown',
   :state => 'PA',
   :zip => '12345',
   :description => 'Go to the back room.'}.merge(attributes)
end

def valid_event_attributes(attributes={})
  {:name => 'Center City Pub Night',
   :description => 'A good time.',
   :location_id => 1,
   :starts_at => Time.now,
   :ends_at => Time.now + 1,
   :event_category_id => 1}.merge(attributes)
end

def valid_event_category_attributes(attributes={})
  {:name => 'Pub Night'}.merge(attributes)
end

