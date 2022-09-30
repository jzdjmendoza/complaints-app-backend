# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Users::Responder.create(first_name: 'Responder', last_name: 'Crims', email: 'responder@crims.com',
            password: 'password', password_confirmation: 'password', city: 'TONDO I / II', barangay: 'Barangay 1')

Users::Complainant.create(first_name: 'Complainant', last_name: 'Crims', email: 'complainant@crims.com',
            password: 'password', password_confirmation: 'password', city: 'TONDO I / II', barangay: 'Barangay 1')

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
