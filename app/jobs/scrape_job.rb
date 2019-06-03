class ScrapeJob < ApplicationJob
  queue_as :default

  def perform(link)
    url_regex = /(www\.)?([a-zA-Z0-9_%]*)\b\.[a-z]{2,4}(\.[a-z]{2})?/
    seller = link.match(url_regex)[2]
    case seller
    when 'amzn' || 'amazon'
      new_product = Product.new(Scraper.amazon_scraper(link))
      new_product.user = User.last # current_user
      new_product.save!
    else
      p "Sorry. Unable to auto-generate a link from #{seller}."
    end
  end
end
