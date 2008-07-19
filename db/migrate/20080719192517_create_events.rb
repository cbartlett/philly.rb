class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.text :description
      t.integer :location_id
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :event_category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
