class RemovePhotoUrlFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :photo_url, :string
  end
end
