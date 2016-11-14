

set :stage, :test

set :profile, "test"

set :deploy_to, "/JavaWeb/hubot.wltest.com"

set :server_name, "10.3.47.62"

set :branch, "master"

set :app_pid, "#{shared_path}/tmp/pids/appliction.pid"

set :default_environment, { 
  'NODE_ENV' => 'test'
}
server fetch(:server_name), user: 'deploy', roles: %w{web app}

