class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :destroy, :edit, :update]

  before_action :require_login, except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    #binding.pry
    #byebug
    #@article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
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
    flash.notice = "Article #{@article.title} created."
    redirect_to article_path(@article)
  end

  def destroy
    #Article.destroy(params[:id])
    @article.destroy
    flash.notice = "Article #{@article.title} deleted."
    redirect_to articles_path
  end

  def edit
    #@article = Article.find(params[:id])
  end

  def update
    @article.update(article_params)

    flash.notice = "Article #{@article.title} was updated."

    redirect_to article_path(@article)
  end

  private

  # method is both reusable for creating articles and makes Strong Parameters
    def article_params
      params.require(:article).permit(:title, :body, :tag_list, :image)
    end

    def set_article
      @article = Article.find(params[:id])
    end
end
