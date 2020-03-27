
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

  get '/articles' do
    @posts = Post.all
    erb :index
  end

  post '/articles' do 
    @articles = Article.create(params)
    redirect to '/articles/'
  end

  get "/articles/:id" do
    @articles = Article.find_by_id(params[:id])
    erb :show
  end
end
