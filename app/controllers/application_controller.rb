
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    @articles = Article.new
    erb :new
  end

  post '/articles' do 
    @articles = Article.create(params)
    redirect to "/articles/#{ @articles.id }"
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get "/articles/:id" do
    @articles = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @articles = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do 
    @articles = Article.find(params[:id])
    @articles.update(params[:articles])
    redirect to "/articles/#{ @articles.id }"
  end

  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect to "/articles"
  end 
end
