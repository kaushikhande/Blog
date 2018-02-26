class GuestsCallAgainJob < ApplicationJob
  queue_as :later

  def perform(article)
    # Do something later
    puts "I am here"
    a = Article.new
    a.title = article.title
    a.text = article.text
    a.save
  end
end
