class ScrapeJob < ApplicationJob
  queue_as :default

  def perform(link, user_id)
    url_regex = /(www\.)?([a-zA-Z0-9_%]*)\b\.[a-z]{2,4}(\.[a-z]{2})?/
    seller = link.match(url_regex)[2]

    amazon_check = ['amzn', 'amazon'].include?(seller)

    if amazon_check
      product_params = Scraper.amazon_scraper(link)
      user_exists = User.find_by_id(user_id).nil?
      return if product_params.nil? || user_exists

      new_product = Product.new(product_params)
      new_product.user_id = user_id
      new_product.remote_photo_url = product_params[:photo]
      if new_product.save!
        ActionCable.server.broadcast "#{user_id}:product_flashes",
        message: "<p>🎉 <strong>#{new_product.title}</strong> successfully added to your store!</p>",
        flash_color: "purple"
        # p "#{new_product.title} added to #{user.first_name}"
      else

      end
    else
      sleep(1) # fix this so it doesn't load on home page. (using 'current_page?' ?)
      ActionCable.server.broadcast "#{user_id}:product_flashes",
      message: "<p>😢 Uhoh! This is embarrassing... We can't automatically add products from <strong>#{seller}</strong> yet. Please add manually.</p>",
      flash_color: "danger"
      # p "Unable to auto-generate a link from #{seller}."
    end
  end
end
