class SessionsController < ApplicationController
  post "/login" do
    # @todo encrypt password :P
    auth_params = fetch_params['auth'] || {}
    user = User.where({ email: auth_params['username'], password: auth_params['password']}).first
    if user
      status 200
      encrypted = TokenGenerator.encrypt({ user_id: user.id })
      token = { token: encrypted }.to_json
      body token
    else
      error(404, { error: 'User not found' })
    end
  end
end
