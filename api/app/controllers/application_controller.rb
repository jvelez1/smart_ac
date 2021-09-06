require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :cross_origin
    set :views, 'app/views'
    set :default_content_type, 'application/json'
  end

  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
  end

  get "/ping" do
    content_type :text
    
    'pong!'
  end

  options "*" do
    response.headers["Allow"] = "GET, PUT, PATCH, POST, DELETE, OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token, HTTP_DEVICE_TOKEN"
    response.headers["Access-Control-Allow-Origin"] = "*"
    200
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
