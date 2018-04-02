class ArticlesController < ApplicationController
  
  #before_filter :authenticate_user!, except: [:index, :show]
  
  def new
    @articles ||= Article.all 
  end
  
  
  def index
    #begin
      #raise RuntimeError.new("You messed up!")
    #  1/0
    #rescue => e
      #Rails.logger.error { "Encountered an error when trying to find or create Person for: , #{e.message} #{e.backtrace.join()}"}
      #Raven.capture_exception(e)
      #render json: { result: 'pending'}
      @item = current_user
      @articles = Article.all
      #render json: { result: 'pending'}
    #end
    
  end
  
  def create
    #render plain: params[:article].inspect
    #puts article_params.inspect
    @article = Article.new(article_params)
    #sleep(10)
    @article.save
    #h = {
    #:title => "New Article1", :text => "This is sample text"
    #}
    
    PygmentsWorker.perform_async
    GuestsCleanupJob.set(wait: 0.1.minute).perform_later(Article.find(14))
    redirect_to articles_path
    
  end
  
  def show
    #sleep(10)
    @article = Article.find(params[:id])
    #render json: { result: 'failure'}
    #render json: { result: 'pending'}
  end
  
  def show1
    #sleep(10)
    #@article = Article.find(params[:id])
    #render json: { result: 'failure'}
    @item = current_user
    render json: { result: 'pending'}
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
