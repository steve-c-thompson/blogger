class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    #binding.pry
    #byebug
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    # binding.pry
    # @article = Article.new
    # @article.title = params[:article][:title]
    # @article.body = params[:article][:body]

    # hash shortcut inside new
    # @article = Article.new(body: params[:article][:body], title: params[:article][:title])

    # doesn't work, need to specify params
    #@article = Article.new(params[:article])

    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  def destroy
    Article.destroy(params[:id])
    redirect_to articles_path
  end

  private

  # method is both reusable for creating articles and makes Strong Parameters
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
