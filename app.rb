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

  post '/new' do
    entry_title = params[:title]
    entry_text = params[:entry]
    entry = Entry.new
    entry.create(entry_title)
    redirect '/'
  end

  run! if app_file == $0
end