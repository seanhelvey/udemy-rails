class ArticlesController < ApplicationController
    def index
        articles = Article.all
        render json: ArticleSerializer.new(articles)
    end
    def show
    end
end
