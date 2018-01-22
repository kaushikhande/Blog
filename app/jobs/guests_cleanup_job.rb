class GuestsCleanupJob < ApplicationJob
  queue_as :default

  def perform(article)
    # Do something later
    #sleep(5)
    #1/0
    #a = Article.first.to_json
    #a = JSON.parse(a)
    #a = a.to_h
    #ar = Article.find(a['id'])
    #ar.title = "Kevin"
    #ar.text = "Commentator"
    #ar.save
    a = Article.new
    a.title = article.title
    a.text = article.text
    a.save
    #redirect_to articles_path
  end
end
