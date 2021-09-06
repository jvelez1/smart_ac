class SessionsController < ApplicationController
  post "/login" do
    status 200
    # @todo
    token = { token: 'Token_generated_here' }.to_json
    body token
  end
end
