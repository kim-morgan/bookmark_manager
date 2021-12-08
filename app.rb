require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmarks'
require './database_connection_setup.rb'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/add' do
    Bookmarks.add(params[:name], params[:url])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @list = Bookmarks.all
    erb :bookmarks
  end

  post '/delete' do
    Bookmarks.delete(params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/update' do
    @id = params[:id]
    erb :update
  end

  post '/bookmarks/:id' do
    Bookmarks.update(params[:id], params[:new_name], params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
