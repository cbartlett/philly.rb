class AddMapUrlAndImageUrlToLocations < ActiveRecord::Migration
  def self.up
  	add_column :locations, :map_url, :string
  	add_column :locations, :image_url, :string
  end

  def self.down
    remove_columns :locations, :map_url, :image_url
  end
end
