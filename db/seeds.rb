# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


if !User.where(email:"admin@admin.de").first
  t = User.new
  t.email = "admin@admin.de"
  t.password = "12345!"
  t.password_confirmation = "12345!"
  t.save!
end