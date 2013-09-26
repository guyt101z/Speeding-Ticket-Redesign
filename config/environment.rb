# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
SpeedingTicketNew::Application.initialize!

#Set Universal Date/Time Format
long = {:default => '%b %d %Y at %I:%M %p', } 
Time::DATE_FORMATS.merge!(long) 
Date::DATE_FORMATS.merge!(long)

#Set Universal Date/Time Format
short = {:short => '%b %d %Y', } 
Time::DATE_FORMATS.merge!(short) 
Date::DATE_FORMATS.merge!(short)

