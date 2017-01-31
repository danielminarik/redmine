class DefaultValues < ActiveRecord::Migration[5.0]
  def change
    change_column :issues, :tracker_id, :integer, default: 1
    change_column :issues, :status_id, :integer, default: 1
    change_column :issues, :priority_id, :integer, default: 2
  end
end
