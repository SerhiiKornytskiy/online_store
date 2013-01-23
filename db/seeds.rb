# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all

Product.create(title: "First Product",
  description: %{<p> explanation here </p>},
  image_url: "http://i2.listal.com/image/1928884/500full.jpg",
  price: 66.6)

Product.create(title: "First Product",
  description: %{<p> explanation here </p>},
  image_url: "http://i2.listal.com/image/1928884/500full.jpg",
  price: 66.6)

Product.create(title: "First Product",
  description: %{<p> explanation here </p>},
  image_url: "http://i2.listal.com/image/1928884/500full.jpg",
  price: 66.6)