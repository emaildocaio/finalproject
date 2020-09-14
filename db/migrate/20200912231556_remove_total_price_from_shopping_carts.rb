class RemoveTotalPriceFromShoppingCarts < ActiveRecord::Migration[6.0]
  def change
    remove_column :shopping_carts, :total_price, :integer
  end
end
