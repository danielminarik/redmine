class AddIssueIdToActivities < ActiveRecord::Migration[5.0]
  def change
    change_table :activities do |t|
      t.integer :issue_id
    end
  end
end
