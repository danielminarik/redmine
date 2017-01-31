class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.string :name
      t.text :description
      t.integer :tracker_id
      t.integer :status_id
      t.integer :priority_id
      t.integer :assignee_id

      t.timestamps
    end
    add_index :issues, :tracker_id
    add_index :issues, :status_id
    add_index :issues, :priority_id
    add_index :issues, :assignee_id
  end
end
