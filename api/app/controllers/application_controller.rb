require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    set :default_content_type, 'application/json'
  end

  get "/ping" do
    content_type :text
    
    'pong!'
  end

  private

  def error(status, messages)
    halt [status, messages.to_json]
  end

  def fetch_params
    body_parameters = request.body.read
    JSON.parse(body_parameters) if body_parameters.present?
  end
end
