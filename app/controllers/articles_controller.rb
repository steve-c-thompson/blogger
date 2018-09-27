class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    #binding.pry
    #byebug
    @article = Article.find(params[:id])
  end
end
