class PygmentsWorker 
  include Sidekiq::Worker
  include Sidekiq::Status::Worker # Important!
  
  sidekiq_options retry: false
  
  def perform()
    sleep(10)
    #1/0
    #a = Article.first.to_json
    #a = JSON.parse(a)
    #a = a.to_h
    #ar = Article.find(a['id'])
    #ar.title = "Kevin"
    #ar.text = "Commentator"
    store vino: 'veritas'
    vino = retrieve :vino
    #ar.save
    a = Article.new
    a.title = "THis"
    a.text = "This is async working"
    a.save
    sleep(20)
    store vino: 'veritas_new'
    
  end
end


