class CreatePollVotes < ActiveRecord::Migration
  def self.up
    create_table :poll_votes do |t|
      t.integer :poll_question_id
      t.integer :poll_answer_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :poll_votes
  end
end
