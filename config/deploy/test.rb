

set :stage, :test

set :profile, "test"

set :deploy_to, "/JavaWeb/hubot.wltest.com"

set :server_name, "10.3.47.62"

set :branch, "master"

set :app_pid, "#{shared_path}/tmp/pids/appliction.pid"

set :default_environment, { 
  "REDIS_URL" => "redis%3A%2F%2Fhaysh%25j37j%4010.3.47.62%3A6379"
}
server fetch(:server_name), user: 'deploy', roles: %w{web app}

