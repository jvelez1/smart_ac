require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    set :default_content_type, 'application/json'
  end

  before do
    handle_body_request
  end

  get "/ping" do
    content_type :text
    
    'pong!'
  end

  private

  def error(status, messages)
    halt [status, messages.to_json]
  end

  def handle_body_request
    body_parameters = request.body.read
    params.merge!(JSON.parse(body_parameters))
  rescue 
    nil
  end
end
