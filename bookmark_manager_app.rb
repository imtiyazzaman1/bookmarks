require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Manager'
    erb :index
  end

  post '/save' do
    Bookmark.create(params['url'], params['title'])
    redirect to '/bookmarks'
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  run! if app_file == $0
end
