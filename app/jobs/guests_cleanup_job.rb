class GuestsCleanupJob < ApplicationJob
  queue_as :default
  include ActiveJobStatus::Hooks
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
    total 100
    at 5, "Entered" 
    sleep 5
    #store vino: 'veritas'
    #vino = retrieve :vino
    a = Article.new
    a.title = article.title
    a.text = article.text
    a.save
    #redirect_to articles_path
    #at 50, "calling Another job" 
    #sleep 5
    #store vino: 'veritas'
    #vino = retrieve :vino
    
    #status.update(foo: true)
    GuestsCallAgainJob.set(wait: 0.1.minute).perform_later(Article.find(14))
    at 75, "calling second Another job" 
    sleep 5
    GuestsCallAgainJob.set(wait: 0.1.minute).perform_later(Article.find(14))
    at 100, "Complete" 
  end
end
