# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times.each do |f|
	p "Create Bigcategory"
	Bigcategory.create(
								 name: Faker::Food.spice,
								 image: File.open(File.join(Rails.root,"app/assets/images/#{rand(1..4)}.jpg")),
	)
end

10.times.each do |f|
	p "Create Category"
	Category.create(
							name: Faker::Food.ingredient,
							bigcategory_id: rand(1..6),
							description: Faker::Lorem.sentence,
							image: File.open(File.join(Rails.root,"app/assets/images/#{rand(1..4)}.jpg"))
	)
end

1000.times.each do |f|
	p "Create Production #{f}"
	a = Category.all.count
	Product.create(
						 name: Faker::Food.ingredient,
						 image: File.open(File.join(Rails.root,"app/assets/images/#{rand(1..4)}.jpg")),
						 description: Faker::ChuckNorris.fact,
						 price: Faker::Number.between(10000, 1000000),
						 qty: Faker::Number.between(1,10000),
						 category_id: rand(1..a)
	)
end
