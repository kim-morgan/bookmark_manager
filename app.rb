require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmarks'
require './lib/comment'
require './lib/tag'
require './lib/bookmark_tag'
require './database_connection_setup.rb'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  post '/add' do
    if Bookmarks.valid?(params[:url]) == false
      redirect '/invalid'
    else
      Bookmarks.add(params[:name], params[:url])
      redirect '/bookmarks'
    end
  end

  get '/invalid' do
    flash[:notice] = 'Please enter valid url'
    redirect '/'
  end

  get '/bookmarks' do
    @list = Bookmarks.all
    @comment = Comment
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

  get '/bookmarks/:id/comments/new' do
    @id = params[:id]
    erb :comment
  end

  get '/bookmarks/:id/tags/new' do
    @id = params[:id]
    erb :tag
  end

  post '/bookmarks/:id' do
    if Bookmarks.valid?(params[:url])
      Bookmarks.update(params[:id], params[:new_name], params[:url])
    else
      flash[:notice] = 'Please enter valid url'
    end
    redirect '/bookmarks'
  end

  post '/bookmarks/:id/comment' do
    Comment.add(params[:text], params[:id])
    redirect '/bookmarks'
  end

  post '/bookmarks/:id/tag' do
    Tag.add(params[:content], params[:id])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
