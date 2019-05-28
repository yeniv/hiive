require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'colored'

# this is just a preview of what's to come - a proof of concept.
# it will be converted to a api-type library, gemified, and put in it's own repo
# for now, a cool way to experiment with amazon's data

query = 'shoe'
page = '1'
doc = Nokogiri::HTML(open("https://www.amazon.com/gp/product/B00SMJHB9Y?pf_rd_p=2d1ab404-3b11-4c97-b3db-48081e145e35&pf_rd_r=B9Z94X9EFAQ6VVM9HAFF"))

p doc.idss
puts "Amazon search for '#{query}', page ##{page}\n".red.underline
doc.css('div.product').each do |el|
  # grab the title
  title = el.css('a.title').first.content
  # grab the author (can be linked or not, hence the logic)
  author = el.css('.ptBrand a').empty? ? el.css('.ptBrand').first.content.gsub!(/by /, '') : el.css('.ptBrand a').first.content
  # grab the image
  image = el.css('.productImage').attribute 'src'
  # grab the product link
  link = el.css('a.title').attribute 'href'

  puts "#{title} by #{author}".green
  puts "image url:".yellow + " #{image}"
  puts "amazon link:".yellow + " #{link}"
  puts ""
end
