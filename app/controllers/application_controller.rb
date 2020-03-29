
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/articles/new' do
    erb :new
  end
 
  post '/articles' do
    @article =Article.create(:title => params["title"], :content => params["content"])
    redirect "/articles/#{@article.id}"
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @articles = Article.find(params["id"])
    erb :show
  end

  get '/articles/:id/edit' do
   
    @articles = Article.find(params["id"])
    erb :edit
  end

  patch '/articles/:id' do
    # binding.pry
    id = params["id"]
 
    new_params = {}
    old_post = Article.find(id)
    new_params[:title] = params["title"]
    new_params[:content] = params["content"]
    old_post.update(new_params)

    redirect "/articles/#{id}"
  end

  delete '/articles/:id' do
    # binding.pry
       Article.destroy(params[:id])
      
       redirect "/articles/new"
  end
end