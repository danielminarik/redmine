class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :message
      t.integer :issue_id, foreign_key: true
      t.integer :user_id

      t.timestamps
    end
    add_index :comments, :issue_id
    add_index :comments, :user_id
  end
end
