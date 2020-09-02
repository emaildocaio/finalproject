class RemoveCoordinatesFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :latitude, :float
    remove_column :products, :longitude, :float
  end
end
