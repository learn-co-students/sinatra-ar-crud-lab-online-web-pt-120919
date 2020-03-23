require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/articles' do
    @articles = Article.all
    erb :'articles/index'
  end

  get '/articles/new' do
    erb :'articles/new'
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :'articles/show'
  end

  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{@article.id}"
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :'articles/edit'
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    new_article = {}
    new_article[:title] = params[:title]
    new_article[:content] = params[:content]
    @article.update(new_article)

    redirect "/articles/#{params[:id]}"
  end

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy

    redirect '/articles'
  end












end
