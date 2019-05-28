require 'nokogiri'
require 'rest-client'
require 'JSON'

def validator(text)
  links = []
  text.gsub(/[",']/, "")
  split = text.split(" ")
  split.each do |link|
    link_match = link.match(/(https?:)?(www\.)?([a-zA-Z0-9_%]*)\b\.[a-z]{2,4}(\.[a-z]{2})?((.[a-zA-Z0-9_%]*)+)?(\.[a-z]*)?/)
    links << link if link_match
  end
  links
end

def amazon_scraper(url)
  product_params = {}
  html_file = RestClient.get(url)
  html_doc = Nokogiri::HTML(html_file)

  product_params[:referal_link] = url
  product_params[:title] = html_doc.search('#title').text.strip
  product_params[:price] = html_doc.search('#price_inside_buybox').text.strip
  product_params[:brand] = html_doc.search('#bylineInfo').text.strip
  product_params[:seller] = "Amazon"

  description = []
  html_doc.search('#feature-bullets script ~ li .a-list-item').each { |item| description << item.text.strip }
  product_params[:description] = description.join("\n")

  images = html_doc.search('#imgTagWrapperId img').attr('data-a-dynamic-image').text
  images_hash = JSON.parse(images.gsub('=>', ':'))
  product_params[:photo] = images_hash.map { |key, value| key }

  product_params
end

def scrape(text)
  url_regex = /(www\.)?([a-zA-Z0-9_%]*)\b\.[a-z]{2,4}(\.[a-z]{2})?/
  validator(text).each do |link|
    seller = link.match(url_regex)[2]
    case seller
    when 'amzn' || 'amazon'
      p amazon_scraper(link)
      sleep 1
    else
      p "Sorry. Unable to auto-generate a link from #{seller}."
    end
  end
end

test_text = "
    Camera Bag: https://amzn.to/2MafNtQ
    Camera Bag Organizer Pouches: https://amzn.to/2suAQ0Z
    GoPro Hero 7 : https://amzn.to/2M7WSzV
    My Drone : https://amzn.to/2spuHDx
    My Smaller Drone : https://amzn.to/2MdxOHF
    ND's For my Drone: https://amzn.to/2VSwkHl
    ND Filters: https://amzn.to/2M9M6ZX
    Cheaper Filter Case: https://amzn.to/2Fsf5Ys
    Main Vlog Camera: https://amzn.to/2RMov6D
    Photo / Timelapse Camera 2: https://amzn.to/2M8W0uS
    VLOG LENS! : https://amzn.to/2Fsiuqi
    Magic ZOOM LENS OF LIFE: https://amzn.to/2ChiDZi
    Gnarly 28-70 Lens: https://amzn.to/2ChiJA8
    DOPE B Roll Lens: https://amzn.to/2VUQVeb
    Small Roll of Gaff Tape: https://amzn.to/2RPUJy6
    Aputure AL-MX Light: https://amzn.to/2VSj9pJ
    3 Legged Thing Tripod: https://amzn.to/2D9dd4v
    Cheap alternative to expensive Time-lapse remote: https://amzn.to/2Dava2z
    Expensive Time-lapse Remote: https://amzn.to/2VUq6GI
    Rode Video Mic Pro Plus: https://amzn.to/2RMROWF
    Think Tank Memory Card Organizers: https://amzn.to/2st9bO2
    Think Tank SD Organizers: https://amzn.to/2Mgvlwl
    Samsung T5 SSD Drive: https://amzn.to/2MbSqQp
  "

scrape(test_text)

# validator(test_text).each_with_index do |link, index|
#   puts "Creating link #{index + 1}..."
#   amazon_scraper(link)
#   # sleep 2
# end

# url = "https://amzn.to/2MafNtQ"
# amazon_scraper(url)

################################

# keep for now

# require 'open-uri'

# url_brand_regex = /(www\.)?([a-zA-Z0-9_%]*)\b\.[a-z]{2,4}(\.[a-z]{2})?/
# product_params[:brand] = url.match(url_brand_regex)[1]

# url = "https://amzn.to/2MafNtQ"
# url = "https://www.amazon.com/Think-Tank-Pocket-Rocket-Carrier/dp/B007TIYZKC/ref=pd_sim_421_2/145-9412881-1087600?_encoding=UTF8&pd_rd_i=B007TIYZKC&pd_rd_r=047d520b-814c-11e9-b5fd-65c62fe45754&pd_rd_w=h9yeP&pd_rd_wg=RjYgX&pf_rd_p=90485860-83e9-4fd9-b838-b28a9b7fda30&pf_rd_r=2K17S3JE4ENDRA4VPK65&psc=1&refRID=2K17S3JE4ENDRA4VPK65"

# peter mckinnan camera link long url
# url = "https://www.amazon.com/gp/product/B07J1ZNZXF/ref=as_li_tl?ie=UTF8&tag=petermckinnon-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=B07J1ZNZXF&linkId=29a53617f1461473660395ed45a5268b"

# wheels link
# url = "https://www.amazon.com/dp/B076B9W78H/?cv_ct_id=amzn1.idea.SP5UNTPPW3RG&cv_ct_pg=storefront&cv_ct_wn=aip-storefront&ref=exp_cov_cyclingmaven_dp_vv_d"
