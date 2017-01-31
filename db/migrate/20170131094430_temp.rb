class Temp < ActiveRecord::Migration[5.0]
  def change
    Tracker.create :name => "Bug"
    Tracker.create :name => "Feature"
    Tracker.create :name => "Devel"
    Tracker.create :name => "Support"    
  end
end
