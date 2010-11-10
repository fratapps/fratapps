class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :group_name

      t.timestamps
    end
    add_index :groups, :group_name, :unique => true
  end

  def self.down
    drop_table :groups
  end
end
