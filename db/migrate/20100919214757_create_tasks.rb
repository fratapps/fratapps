class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :name
      t.integer :created_by_id
      t.integer :points
      t.text :description
      t.integer :taken_by_id
      t.integer :user_id
      t.string :status, :default => 'open'
      t.date :taken_on
      t.date :complete_on
      
      
      t.timestamps
    end
    add_index :tasks, :user_id
  end

  def self.down
    drop_table :tasks
  end
end
