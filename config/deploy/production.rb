set :user,            'ubuntu'
server '52.23.207.23', port: 22, roles: [:web, :app, :db], primary: true


# Don't change these unless you know what you're doing
set :stage,           :production
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :ssh_options,     { forward_agent: true, user: fetch(:user)}