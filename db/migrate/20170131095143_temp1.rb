class Temp1 < ActiveRecord::Migration[5.0]
  def change
    Status.create :name => "New"
    Status.create :name => "In Progress"
    Status.create :name => "Closed"
    Priority.create :name => "Low"
    Priority.create :name => "Normal"
    Priority.create :name => "High"
  end
end
