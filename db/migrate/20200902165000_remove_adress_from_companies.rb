class RemoveAdressFromCompanies < ActiveRecord::Migration[6.0]
  def change
    remove_column :companies, :adress, :string
  end
end
