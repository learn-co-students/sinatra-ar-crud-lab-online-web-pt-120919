
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

  post '/artices' do
    Articles.create(params)
    redirect '/articles'
  end

  get '/articles' do
    @articles = Articles.all
    erb :index
  end

  get '/articles/:id' do
    @articles = Articles.find(params["id"])
    erb :show
  end

  get '/articles/:id/edit' do
    @post = Articles.find(params["id"])
    erb :edit
  end

  patch '/articles/:id' do
    @articles = Articles.find_by_id(params[:id])
    @articles.name = params[:name]
    @articles.content = params[:content]
    @articles.save
    erb :show
  end

  delete '/articles/:id/delete' do
    @articles = Articles.find_by_id(params[:id])
    @articles.delete
    erb :deleted
  end
end