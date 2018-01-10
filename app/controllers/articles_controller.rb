class ArticlesController < ApplicationController
  def new
  end
  
  
  def index
    begin
      #raise RuntimeError.new("You messed up!")
      1/0
    rescue => e
      Rails.logger.error { "Encountered an error when trying to find or create Person for: , #{e.message} #{e.backtrace.join()}"}
      Raven.capture_exception(e)
      @articles = Article.all
    end
    
  end
  
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    
    @article.save
    redirect_to @article
    
  end
  
  def show
    sleep(10)
    @article = Article.find(params[:id])
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
