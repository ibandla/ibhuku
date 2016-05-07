namespace :invoke do
  desc 'Run a bash task on a remote server. cap environment invoke:bash[\'ls -la\'] '
  task :bash, :execute do |_task, args|
    on roles(:app), in: :sequence do
     SSHKit.config.output_verbosity = Logger::DEBUG
      execute args[:execute]
    end
  end

  desc 'Run a rake task on a remote server. cap environment invoke:rake[\'db:migrate\'] '
  task :rake, :task do |_task, args|
    on primary :app do
      within current_path do
        with rails_env: fetch(:rails_env) do
          SSHKit.config.output_verbosity = Logger::DEBUG
          rake args[:task]
        end
      end
    end
  end
end