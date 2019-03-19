class ArticlesController < ApplicationController
    def index
        articles = Article.recent.page(params[:page]).per(params[:per_page])
        render json: ArticleSerializer.new(articles)
    end

    def show
        articles = Article.recent.find(params[:id])
        render json: ArticleSerializer.new(articles)
    end
end
