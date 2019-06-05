class CreateSocialMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :social_media do |t|
      t.references :user, foreign_key: true
      t.string :url
      t.string :site

      t.timestamps
    end
  end
end
