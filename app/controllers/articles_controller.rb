class ArticlesController < ApplicationController
    def index
        render json: ArticleSerializer.new(Article.all)
    end
    def show
        render json: ArticleSerializer.new(Article.find(params[:id]))
    end
end