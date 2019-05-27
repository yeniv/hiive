class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :user, foreign_key: true
      t.string :referal_link
      t.string :title
      t.integer :price
      t.text :description
      t.string :photo_url
      t.string :brand
      t.string :seller

      t.timestamps
    end
  end
end
