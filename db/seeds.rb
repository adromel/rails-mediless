# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'

Symptom.destroy_all
EssentialOil.destroy_all
User.destroy_all
OilTreatment.destroy_all
Acupoint.destroy_all
AcupointTreatment.destroy_all
Specialist.destroy_all

csv_text = File.read(Rails.root.join('lib', 'seeds', 'symptoms.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  s = Symptom.new
  s.name = row['name']
  s.save
  puts "#{s.name} saved"
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'oil.csv'))
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

csv_text = File.read(Rails.root.join('lib', 'seeds', 'oil_treatment.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  o = OilTreatment.new
  o.essential_oil_id = row['essential_oil_id']
  o.symptom_id = row['symptom_id']
  o.posology = row['posology']
  o.save
  puts "#{o.essential_oil_id} saved"
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'acupoints.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  a = Acupoint.new
  a.name = row['name']
  a.coordinates = row['coordinates']
  a.save
  puts "#{a.coordinates} saved"
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'acupointTreatment.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  at = AcupointTreatment.new
  at.symptom_id = row['symptom_id']
  at.acupoint_id = row['acupoint_id']
  at.save
  puts "#{at.acupoint_id} saved"
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'specialists.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  sp = Specialist.new
  sp.name = row['name']
  sp.address = row['address']
  sp.phone_number = row['phone_number']
  sp.speciality = row['speciality']
  sp.save
  puts "#{sp.speciality} saved"
end
