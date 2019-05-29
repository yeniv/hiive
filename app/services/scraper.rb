# require 'nokogiri'
require 'rest-client'
# require 'JSON'

class Scraper
  def self.validator(text)
    links = []
    text.gsub(/[",']/, "")
    split = text.split(" ")
    split.each do |link|
      link_match = link.match(/(https?:)?(www\.)?([a-zA-Z0-9_%]*)\b\.[a-z]{2,4}(\.[a-z]{2})?((.[a-zA-Z0-9_%]*)+)?(\.[a-z]*)?/)
      links << link if link_match
    end
    links
  end

  def self.amazon_scraper(url)
    begin
      product_params = {}
      html_file = RestClient.get(url)
      html_doc = Nokogiri::HTML(html_file)

      product_params[:referal_link] = url
      product_params[:title] = html_doc.search('#title').text.strip
      product_params[:price] = html_doc.search('#price .priceBlockBuyingPriceString').text.strip
      product_params[:brand] = html_doc.search('#bylineInfo').text.strip
      product_params[:seller] = "Amazon"

      description = []
      html_doc.search('#feature-bullets script ~ li .a-list-item').each { |item| description << item.text.strip }
      product_params[:description] = description.join("\n")

      images = html_doc.search('#imgTagWrapperId img').attr('data-a-dynamic-image').text
      images_hash = JSON.parse(images.gsub('=>', ':'))
      product_params[:photo] = (images_hash.map { |key, value| key }).first # remove (.first) once we can accept multiple images

      product_params
    rescue => error
      puts error.inspect
    end
  end

  def self.go(text)
    product_params = []
    url_regex = /(www\.)?([a-zA-Z0-9_%]*)\b\.[a-z]{2,4}(\.[a-z]{2})?/
    validator(text).each do |link|
      seller = link.match(url_regex)[2]
      case seller
      when 'amzn' || 'amazon'
        product_params << amazon_scraper(link)
        # sleep 1
      else
        p "Sorry. Unable to auto-generate a link from #{seller}."
      end
    end
    product_params
  end
end
