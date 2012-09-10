class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.string :name
      t.string :fburl
      t.string :fbid
      t.string :url
      t.string :description
      t.integer :client_id

      t.timestamps
    end
  end

  def self.down
    drop_table :properties
  end
end
