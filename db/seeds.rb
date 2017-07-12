# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new
u.email = "1@qq.com"
u.password = "@12345Ab"
u.password_confirmation = "@12345Ab"
u.is_admin = true
u.save

product = Product.new
product.title = "iphone7"
product.description = "this is a ipone7"
product.price = "7500"
product.quantity = "25"
product.image = "http://oqibh4tbw.bkt.clouddn.com/%E8%8A%B1%E7%93%A3%E5%8D%A1%E5%B8%83%E5%A5%87%E8%AF%BA.jpg"
product.position
product.save
