class AddCreatorTypeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :creator_type, :string
  end
end
