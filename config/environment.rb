# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
SpeedingTicketNew::Application.initialize!

#Set Universal Date/Time Format
my_date_formats = {:default => '%b %d %Y at %I:%M %p'} 
Time::DATE_FORMATS.merge!(my_date_formats) 
Date::DATE_FORMATS.merge!(my_date_formats)