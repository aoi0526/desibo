# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


OccupationGenre.create!(
  [
    { id: 1, name: '農林水産業' },
    { id: 2, name: '建築業' },
    { id: 3, name: '飲食業' },
    { id: 4, name: '観光業' },
    { id: 5, name: '宿泊業' },
    { id: 6, name: '小売業' },
    { id: 7, name: '伝統工芸' }
  ]
)


