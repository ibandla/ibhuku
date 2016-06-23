server '10.21.210.27', port: 22, roles: [:web, :app, :db], primary: true

set :user,            'cmakamara'
set :application,     'ibhuku'
set :repo_url,        'git@github.com:ibandla/ibhuku.git'
set :puma_workers,    0
set :puma_threads,    [4, 16]
set :stage,           :school

set :pty,             true
set :use_sudo,        false
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord


if ENV['IN_SCHOOL']

  school_host = '192.168.133.55'
else 
  school_host = '41.89.6.209'
end

ssh_command = "ssh -p 13322 deploy@#{school_host} -W %h:%p"
set :ssh_options, { forward_agent: true, user: 'cmakamara', proxy: Net::SSH::Proxy::Command.new(ssh_command)}

## Defaults:
# set :scm,           :git
# set :branch,        :master
# set :format,        :pretty
# set :log_level,     :debug
# set :keep_releases, 5

## Linked Files & Directories (Default None):
# set :linked_files, %w{config/database.yml}
# set :linked_dirs,  %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end


namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end
 desc 'Symbolic links'
  task :make_links do
  on roles(:app) do
    execute "rm /var/www/html/ibandla/ibandla; rm /var/www/html/assets; ln -s /home/cmakamara/apps/ibhuku/shared/public/assets/ /var/www/html/; ln -s /home/cmakamara/apps/ibhuku/shared/public /var/www/html/ibandla/ibandla; "
    execute "sed -i '18s/.*/config.relative_url_root = \"\/ibandla\"/'  /home/cmakamara/apps/ibhuku/current/config/environments/school.rb"
  end
end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  before :starting,     :check_revision
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  after  :finishing,    :make_links
  after  :finishing,    :restart

end

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma