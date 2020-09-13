class AddAmountToShoppingCarts < ActiveRecord::Migration[6.0]
  def change
    add_monetize :shopping_carts, :amount, currency: { present: false }
  end
end
