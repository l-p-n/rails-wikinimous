class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    # find_article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(strong_params)
    @article.save
    redirect_to article_path(@article) # this is implicit '@article.id'
  end

  def edit
    # find_article
  end

  def update
    # find_article
    @article.update(strong_params)
    redirect_to article_path(@article)
  end

  def destroy
    # find_article
    @article.destroy
    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def strong_params
    params.require(:article).permit(:title, :content)
  end
end
