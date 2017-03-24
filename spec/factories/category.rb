FactoryGirl.define do
	factory :category do
		name { Faker::Name.name }
		text { Faker::Lorem.sentences}
		bigcategory
	end
end
