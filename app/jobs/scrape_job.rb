class ScrapeJob < ApplicationJob
  queue_as :default

  def perform(link, user)
    url_regex = /(www\.)?([a-zA-Z0-9_%]*)\b\.[a-z]{2,4}(\.[a-z]{2})?/
    seller = link.match(url_regex)[2]

    amazon_check = ['amzn', 'amazon'].include?(seller)

    if amazon_check
      product_params = Scraper.amazon_scraper(link)
      return if product_params.nil?

      new_product = Product.new(product_params)
      new_product.user = user # current_user
      new_product.remote_photo_url = product_params[:photo]
      new_product.save!

      ActionCable.server.broadcast 'product_flashes',
      message: "<p>🎉 <strong>#{new_product.title}</strong> successfully added to your store!</p>",
      flash_color: "purple"
      p "#{new_product.title} added to #{user}"
    else
      sleep(1) # fix this so it doesn't load on home page. (using 'current_page?' ?)
      ActionCable.server.broadcast 'product_flashes',
      message: "<p>😢 Uhoh! This is embarrassing... We can't automatically add products from <strong>#{seller}</strong> yet. Please add manually.</p>",
      flash_color: "danger"
      p "Unable to auto-generate a link from #{seller}."
    end
  end
end

