class Api::ApiController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
end