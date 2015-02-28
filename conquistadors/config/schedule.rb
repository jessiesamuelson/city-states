# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "/Users/jessicasamuelson/src/projects/city-states/conquistadors/log/cron_log.log"

every 2.minutes do
  rake "country:flourish"
  rake "country:moneygrab"
end

every 4.minutes do
  rake "country:plague"
end



# Learn more: http://github.com/javan/whenever
