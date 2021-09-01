require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
  end

  get "/ping" do
    content_type :text
    
    'pong!'
  end

end
