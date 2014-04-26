# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if !Rails.env.production?
puts "Loading Seed Data because we are in #{Rails.env} mode."
  Team.create(name: "RTM")
  Team.create(name: "What's going on")
  Team.create(name: "Trade Advisor")
  Team.create(name: "Teachback")
  Team.create(name: "Vaperrater")

  User.create(name: "Pito Salas", nickname: "pito", provider: "Test")
  User.create(name: "Chris Salas", nickname: "chris", provider: "Test")
  User.create(name: "Daniel Salas", nickname: "daniel", provider: "Test")
  User.create(name: "Larry Salas", nickname: "larry", provider: "Test")

end
