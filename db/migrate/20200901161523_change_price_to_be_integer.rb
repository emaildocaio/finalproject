class ChangePriceToBeInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :shopping_carts, :total_price, :integer
  end
end
