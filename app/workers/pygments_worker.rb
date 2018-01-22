class PygmentsWorker 
  include Sidekiq::Worker
  
  sidekiq_options retry: false
  
  def perform(article)
    sleep(5)
    #1/0
    #a = Article.first.to_json
    #a = JSON.parse(a)
    #a = a.to_h
    #ar = Article.find(a['id'])
    #ar.title = "Kevin"
    #ar.text = "Commentator"
    #ar.save
    a = Article.new
    a.title = "THis"
    a.text = "This is async working"
    a.save
  end
end


