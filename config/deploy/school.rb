server '10.21.210.27', port: 22, roles: [:web, :app, :db], primary: true

set :user,            'cmakamara'
set :stage,           :school
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
if ENV['IN_SCHOOL']

  school_host = '192.168.133.55'
else 
  school_host = '41.89.6.209'
end

school_user = 'mnch'
ssh_command = "ssh -p 13322 -W %h:%p #{school_user}@#{school_host}"
set :ssh_options,     { forward_agent: true, user: 'cmakamara', proxy: Net::SSH::Proxy::Command.new('ssh -p 13322 mnch@41.89.6.209 -W %h:%p')}