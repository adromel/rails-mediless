# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'


csv_text = File.read(Rails.root.join('lib', 'seeds', 'symptoms.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  s = Symptom.new
  s.name = row['name']
  s.save
  puts "#{s.name} saved"
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'oils.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  t = EssentialOil.new
  t.name = row['name']
  t.description = row['description']
  t.photo = row['photo']
  t.save
  puts "#{t.name} saved"
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'users.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  u = User.new
  u.email = row['email']
  u.password = row['password']
  u.save
  puts "#{u.email} saved"
end

