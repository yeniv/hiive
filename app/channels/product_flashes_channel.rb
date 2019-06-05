class ProductFlashesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "#{params['user_id']}:product_flashes"
  end
end
