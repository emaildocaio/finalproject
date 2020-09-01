class CreateShoppingCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_carts do |t|
      t.string :voucher
      t.string :status
      t.float :total_price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
