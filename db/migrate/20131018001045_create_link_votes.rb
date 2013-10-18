class CreateLinkVotes < ActiveRecord::Migration
  def change
    create_table :link_votes do |t|
      t.integer :voter_id
      t.integer :link_id
      t.integer :vote

      t.timestamps
    end
    add_index :link_votes, :voter_id
    add_index :link_votes, :link_id
  end
end
