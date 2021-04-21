require 'sinatra/base'
require 'sinatra/reloader'
require './lib/entry.rb'

class DiaryApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @entries = Entry.all
    erb(:index)
  end

  get '/' do
    erb(:entries)
  end

  run! if app_file == $0
end