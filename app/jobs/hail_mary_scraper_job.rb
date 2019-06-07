class HailMaryScraperJob < ApplicationJob
  queue_as :default

  def perform(links, user_id)
    Scraper.single_job(links, user_id)
  end
end
