class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :encrypted_password
      t.string :salt
      t.integer :total_points, :default => 0
      t.boolean :super_admin, :default => false
      t.string :email
      t.integer :group_id

      t.timestamps
    end
    add_index :users, :group_id
  end

  def self.down
    drop_table :users
  end
end
