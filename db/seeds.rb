# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.production?
  puts "Loading #{Rails.env} mode seed data."
  Team.create(name: "Faker")
else
  puts "Loading #{Rails.env} mode seed data."
  Team.create(name: "RTM")
  Team.create(name: "What's going on")
  Team.create(name: "Trade Advisor")
  Team.create(name: "Teachback")
  Team.create(name: "Vaperrater")

  User.create(name: "Pito Salas", nickname: "pito", provider: "Test", team_id: 1)
  User.create(name: "Chris Salas", nickname: "chris", provider: "Test", team_id: 1)
  User.create(name: "Daniel Salas", nickname: "daniel", provider: "Test", team_id: 1)
  User.create(name: "Larry Salas", nickname: "larry", provider: "Test", team_id: 1)
end
