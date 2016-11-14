# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'hubot-dabai'
set :repo_url, 'git@git.rfdoa.cn:java/hubot-dabai.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('node_modules','tmp/pids')
# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  task :restart  do
    invoke :"deploy:stop"
    invoke :"deploy:start"
  end

  task :start  do
    on roles(:web)  do
      within current_path do
        #unless test("[ -f `ps -ef | grep syncapp 'awk {print $2}'` ]")
          info ">>>>> start"
          execute "./bin/test-hubot"
        # else 
        #  error ">>>>>> already started"
        # end 

      end
    end
  end

  task :stop  do
    on roles(:web)  do
      within current_path do
        if test("[ -f `ps -ef | grep syncapp 'awk {print $2}'` ]")
          info ">>>>> stop"
          execute "kill -9 `ps -ef | grep syncapp 'awk {print $2}'`"
        end 
      end
    end
  end
  task :dep do 
    on roles(:web)  do
      within current_path do
        execute "npm install"
      end
    end
 
  end
end
after "deploy:publishing", "deploy:dep"
after "deploy:publishing", "deploy:restart"
