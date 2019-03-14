class ArticlesController < ApplicationController
  def index
    articles = Article.recent.page(params[:page]).per(params[:per_page])
    render json: ArticleSerializer.new(articles)
  end

  def show
    render json: ArticleSerializer.new(Article.find(params[:id]))
  end
end