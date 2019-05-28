# require 'open-uri'
require 'nokogiri'
require 'rest-client'
require 'JSON'

product_params = {}

# peter mckinnan camera link
url = "https://amzn.to/2MafNtQ"

html_file = RestClient.get(url)
html_doc = Nokogiri::HTML(html_file)

product_params[:referal_link] = url
product_params[:title] = html_doc.search('#title').text.strip
product_params[:price] = html_doc.search('#price_inside_buybox').text.strip
product_params[:brand] = html_doc.search('#bylineInfo').text.strip
product_params[:brand] = html_doc.search('#bylineInfo').text.strip
product_params[:seller] = "Amazon"

description = []
html_doc.search('#feature-bullets script ~ li .a-list-item').each { |item| description << item.text.strip }
product_params[:description] = description.join("\n")

images = html_doc.search('#imgTagWrapperId img').attr('data-a-dynamic-image').text
images_hash = JSON.parse(images.gsub('=>', ':'))
product_params[:photo] = images_hash.map { |key, value| key }

p product_params
# return product_params


# keep for now

# url_brand_regex = /(www\.)?([a-zA-Z0-9_%]*)\b\.[a-z]{2,4}(\.[a-z]{2})?/
# product_params[:brand] = url.match(url_brand_regex)[1]

# peter mckinnan camera link long url
# url = "https://www.amazon.com/gp/product/B07J1ZNZXF/ref=as_li_tl?ie=UTF8&tag=petermckinnon-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=B07J1ZNZXF&linkId=29a53617f1461473660395ed45a5268b"

# wheels link
# url = "https://www.amazon.com/dp/B076B9W78H/?cv_ct_id=amzn1.idea.SP5UNTPPW3RG&cv_ct_pg=storefront&cv_ct_wn=aip-storefront&ref=exp_cov_cyclingmaven_dp_vv_d"
