class MygemMigration < ActiveRecord::Migration
  def self.up
    create_table :mygems do |t|
      t.string      :name
      t.string      :sql_query
      t.text        :body

      t.timestamps
    end

    add_index :mygems, :mygemsid
    add_index :mygems, :name
  end

  def self.down
    drop_table :mygems
  end
end