# frozen_string_literal: true

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
food4 = MenuItem.create(name: 'Pizza', description: 'Better than Dominos Pizza', price: 50, category: 1)
food5 = MenuItem.create(name: 'Sushi', description: 'Sushi cut by Hattori Hanzo', price: 100, category: 1)
food6 = MenuItem.create(name: 'T-bone Steak', description: 'USA USA USA!', price: 120, category: 1)
food7 = MenuItem.create(name: 'Coffee', description: 'Black as midnight on a moonless night', price: 15, category: 2)
food8 = MenuItem.create(name: 'Mountain Dew', description: 'Goes good with Doritos', price: 15, category: 2)
