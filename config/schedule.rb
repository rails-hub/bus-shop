set :output, "log/cron.log"

every 15.minutes do
  #For Cron Job
  runner "username = Settings.get('ga_username');password = Settings.get('ga_password');profile_id = Settings.get('ga_profile_id');Garb::Session.login(username, password);profile = Garb::Profile.first(profile_id);pageviews = profile.pageviews(:start_date => (Date.today-1), :end_date => Date.today-1, :limit => 20).first.pageviews;@mc = MainChart.new(:pageviews => pageviews, :dates => Date.today-1);@mc.save"
end

every 1.day do 
  runner "wget http://lvh.me:3000/cron/cron_to_update_bus_stats"
end

# every 1.minute do
#   runner "wget http://localhost:3000/admin/recyclebins/set_delete_timer"
# end