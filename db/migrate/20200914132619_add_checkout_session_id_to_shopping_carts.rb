class AddCheckoutSessionIdToShoppingCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :shopping_carts, :checkout_session_id, :string
  end
end
