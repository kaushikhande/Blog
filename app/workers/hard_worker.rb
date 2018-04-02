class HardWorker
  include Sidekiq::Worker
  
  include Sidekiq::Status::Worker # Important!

  def perform(*args)
    # Do something
  end
end
