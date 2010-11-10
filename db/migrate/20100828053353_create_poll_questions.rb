class CreatePollQuestions < ActiveRecord::Migration
  def self.up
    create_table :poll_questions do |t|
      t.string :question
      t.integer :max_responses
      t.integer :created_by_id

      t.timestamps
    end
  end

  def self.down
    drop_table :poll_questions
  end
end
