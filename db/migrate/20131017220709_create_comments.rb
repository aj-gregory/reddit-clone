class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :parent_comment_id
      t.integer :link_id
      t.text :body
      t.integer :commenter_id

      t.timestamps
    end
    add_index :comments, :parent_comment_id
    add_index :comments, :link_id
    add_index :comments, :commenter_id
  end
end
