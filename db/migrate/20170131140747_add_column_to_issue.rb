class AddColumnToIssue < ActiveRecord::Migration[5.0]
  def change
    add_column :issues, :created_by, :integer
    add_index :issues, :created_by
  end
end
