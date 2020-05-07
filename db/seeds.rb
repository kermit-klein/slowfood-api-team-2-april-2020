# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
food1 = MenuItem.create(name: 'Pickled Egg', description: 'An egg that is in a reeeeal pickle!', price: 69, category: 0)
food2 = MenuItem.create(name: 'Bread', description: 'Simply bread', price: 25, category: 0)
food3 = MenuItem.create(name: 'Ham Sandwich', description: 'No, not hamBURGER, ham SANDWICH', price: 42, category: 1)