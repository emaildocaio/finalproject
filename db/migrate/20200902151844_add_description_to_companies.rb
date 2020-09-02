class AddDescriptionToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :description, :string
  end
end
