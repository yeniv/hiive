class ProductFlashesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'product_flashes'
  end
end
