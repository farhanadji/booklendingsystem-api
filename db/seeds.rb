# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Book.create!(title: 'Full Throttle', author: 'John hill', price: 10000, availability: true)
Book.create!(title: 'Where the Crawdads Sing', author: 'Delia Owens', price: 7000, availability: false)
Book.create!(title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', price: 6000, availability: true)