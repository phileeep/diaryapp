require 'sinatra/base'
require 'sinatra/reloader'
# require './lib/bookmark'

class DiaryApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end

  run! if app_file == $0
end