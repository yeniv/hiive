class ScrapeJob < ApplicationJob
  queue_as :default

  def perform(link, user_id)
    url_regex = /(www\.)?([a-zA-Z0-9_%]*)\b\.[a-z]{2,4}(\.[a-z]{2})?/
    seller = link.match(url_regex)[2]

    amazon_check = ['amzn', 'amazon'].include?(seller)

    if amazon_check
      product_params = Scraper.amazon_scraper(link)
      return if product_params.nil?

      new_product = Product.new(product_params)
      new_product.user_id = user_id # current_user
      new_product.remote_photo_url = product_params[:photo]
      new_product.save!
    else
      p "Sorry. Unable to auto-generate a link from #{seller}."
    end
  end
end
