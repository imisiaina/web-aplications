require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  # Declares a route that responds to a request with:
  #  - a GET method
  #  - the path /
  post '/sort-order' do
    names = params[:names]
    sorted_names = names.split(",").sort.join(",")
    return sorted_names
  end
end



# Request:
# POST /submit

# # With body parameters:
# name=Leo
# message=Hello world

# # Expected response (2OO OK):
# Thanks Leo, you sent this message: "Hello world"

