# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

apartments = Apartment.create([{name: '123 Main Street'}])

users = User.create([{apartment_id: 1, email: 'sarah@example.com', encrypted_password: 'password', sign_in_count: 2, created_at: 20151114155303, updated_at: 20151114155303, name: "Sarah"}])
