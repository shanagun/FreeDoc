# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'date'

doctors = []
patients = []
cities = []
specialties = ['radiologie', 'dermatologie', 'neurologie', 'chirurgie']
arr_spec = []

City.destroy_all
10.times do
  city = City.create!(city_name: Faker::Address.city)
  cities << city
end
puts "city done"

Doctor.destroy_all
10.times do 
  doctor = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name , zip_code: Faker::Address.zip_code, city_id: cities[rand(0..9)].id)
  doctors << doctor
end
puts "doctor done"

Patient.destroy_all
50.times do
  patient = Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: cities[rand(0..9)].id)
  patients << patient
end
puts "patient done"


Appointment.destroy_all
t1 = Time.parse("2019-10-25 14:40:34")
t2 = Time.parse("2021-12-23 00:00:00")
50.times do
  Appointment.create!(
    date: rand(t1..t2), 
    city_id: cities[rand(0..9)].id, 
    doctor_id: doctors[rand(0..9)].id, 
    patient_id: patients[rand(0..49)].id)
end
puts "appointment done"

Specialty.destroy_all
specialties.each do |index|
  spec = Specialty.create!(specialty: index)
  arr_spec << spec
end
puts "specialty done"

10.times do 
  JoinTableDoctorSpecialty.create!(doctor_id: doctors[rand(0..9)].id, specialty_id: arr_spec[rand(0..3)].id)
end

puts "Fini !"