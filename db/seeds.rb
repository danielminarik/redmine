# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Tracker.create :name => "Bug"
# Tracker.create :name => "Feature"
# Tracker.create :name => "Devel"
# Tracker.create :name => "Support"
# Status.create :name => "New"
# Status.create :name => "In Progress"
# Status.create :name => "Closed"
# Priority.create :name => "Low"
# Priority.create :name => "Normal"
# Priority.create :name => "High"

user = User.find_or_create_by(email: "admin@mail.com")
user.password = "heslo1"
user.admin = true
user.save