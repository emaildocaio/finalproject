class ChangePriceTypeToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :price, :integer
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
