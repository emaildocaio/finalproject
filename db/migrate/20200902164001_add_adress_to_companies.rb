class AddAdressToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :adress, :string
  end
end
