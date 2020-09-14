class AddTotalPriceToShoopingCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :shopping_carts, :total_price, :integer
  end
end
