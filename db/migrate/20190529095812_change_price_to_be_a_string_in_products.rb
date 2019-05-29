class ChangePriceToBeAStringInProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :price, :string
  end
end
