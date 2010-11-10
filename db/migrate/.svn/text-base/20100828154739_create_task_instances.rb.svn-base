class CreateTaskInstances < ActiveRecord::Migration
  def self.up
    create_table :task_instances do |t|
      t.integer :task_id
      t.integer :user_id
      t.string :status, :default => "open"
      t.date :taken_on
      t.date :complete_on

      t.timestamps
    end
  end

  def self.down
    drop_table :task_instances
  end
end
