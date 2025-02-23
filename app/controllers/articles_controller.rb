class ArticlesController < ApplicationController
    before_action :set_article_byID,:only => [:update,:destroy,:show]
    def index
        @articles = Article.all
        @temp = []
        @articles.map do |article|
            @temp.push({
                :article => article,
            })
        end
        render :json => @temp
    end

    def create
        article = Article.new(article_params)
        if article.save
            render :json => {
                :article => article,
            }
        end
        
    end

    def update
        @article.update(article_params)

        if @article.save
            render :json => {
                :article => @article
            }
        end
    end

    def destroy
        @article.destroy
    end

    def refresh
        Article.destroy_all
    end

    def show
        if @article.valid?
            render :json => {
                :article => @article
            } 
        end
    end

    private

    def article_params
        params.permit(:name,:price,:qt)
    end

    def set_article_byID
        @article = Article.find(params[:id])
    end

end