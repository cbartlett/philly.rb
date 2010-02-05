class AddMapQueryAndZoomToLocations < ActiveRecord::Migration
  def self.up
    add_column :locations, :map_query, :string
    add_column :locations, :zoom, :integer
  end

  def self.down
    remove_columns :locations, :map_query, :zoom
  end
end
