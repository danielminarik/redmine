class Insertion < ActiveRecord::Migration[5.0]
  def change
    Tracker.create :name => "Bug"
    Tracker.create :name => "Feature"
    Tracker.create :name => "Devel"
    Tracker.create :name => "Support"    
    Status.create :name => "New"
    Status.create :name => "In Progress"
    Status.create :name => "Closed"
    Priority.create :name => "Low"
    Priority.create :name => "Normal"
    Priority.create :name => "High"
  end
end
