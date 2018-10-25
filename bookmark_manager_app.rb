require 'sinatra/base'
require './lib/bookmark'
require 'uri'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base

  enable :sessions
  enable :method_override
  register Sinatra::Flash

  get '/' do
    'Bookmark Manager'
    erb :index
  end

  post '/save' do
    url = params['url']
    if Bookmark.create(params['url'], params['title'])
      redirect to '/bookmarks'
    else
      flash[:notice] = "URL is invalid, try again."
      redirect '/add_bookmark'
    end
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  get '/edit_bookmark/:id' do
    @bookmark = Bookmark.find(params[:id])
    erb :edit_bookmark
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end

  patch '/bookmark/:id' do
    Bookmark.update(params[:id], params[:url], params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
