class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :session_token

      t.timestamps
    end
    add_index :users, :name
  end
end
