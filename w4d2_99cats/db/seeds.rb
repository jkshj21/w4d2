# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CatRentalRequest.create!(cat_id: 1, start_date: '2017/09/17', end_date: '2017/09/23')
CatRentalRequest.create!(cat_id: 1, start_date: '2017/09/21', end_date: '2017/09/26')
CatRentalRequest.create!(cat_id: 1, start_date: '2017/09/10', end_date: '2017/09/25')
CatRentalRequest.create!(cat_id: 2, start_date: '2017/09/10', end_date: '2017/09/25')
CatRentalRequest.create!(cat_id: 4, start_date: '2017/09/10', end_date: '2017/09/25')
