class SessionsController < ApplicationController
  post "/login" do
    # @todo
    user = User.first
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
