json.array! @user_products do |product|
  json.extract! product, :id, :title, :price, :photo
end
