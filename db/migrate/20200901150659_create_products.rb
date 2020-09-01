class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :type
      t.integer :capacity
      t.boolean :status, default: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
