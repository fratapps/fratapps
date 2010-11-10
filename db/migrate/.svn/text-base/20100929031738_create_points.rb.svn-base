class CreatePoints < ActiveRecord::Migration
  def self.up
    create_table :points do |t|
      t.integer :user_id
      t.integer :points, :default => 0

      t.timestamps
    end
    add_index :points, :user_id
  end

  def self.down
    drop_table :points
  end
end
