# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)

	if(!Rails.env.school?)
		run Rails.application
	else
		map '/ibandla' do
			run Rails.application
		end
	end
