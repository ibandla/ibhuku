server '10.21.210.27', port: 22, roles: [:web, :app, :db], primary: true

set :user,            'cmakamara'
set :stage,           :school
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
if ENV['IN_SCHOOL']

  school_host = '192.168.133.55'
else 
  school_host = '41.89.6.209'
end

ssh_command = "ssh -p 13322 mnch@#{school_host} -W %h:%p"
set :ssh_options, { forward_agent: true, user: 'cmakamara', proxy: Net::SSH::Proxy::Command.new(ssh_command)}