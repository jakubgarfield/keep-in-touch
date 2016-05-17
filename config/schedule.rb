set :env_path,    '"$HOME/.rbenv/shims":"$HOME/.rbenv/bin"'
set :output, '/home/deploy/linkyard/current/log/cron.log'

job_type :rake,   %q{ cd :path && PATH=:env_path:"$PATH" RAILS_ENV=:environment bundle exec rake :task --silent :output }
job_type :runner, %q{ cd :path && PATH=:env_path:"$PATH" bundle exec rails runner -e :environment ':task' :output }
job_type :script, %q{ cd :path && PATH=:env_path:"$PATH" RAILS_ENV=:environment bundle exec script/:task :output }


every 4.hours do
  runner "NotifyCatchups.run"
end
