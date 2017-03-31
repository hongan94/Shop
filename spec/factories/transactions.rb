FactoryGirl.define do
  factory :transaction do
    user_name { Faker::Name.name}
		user_email {Faker::Internet.email }
		user_phone  '0906512162'
		user_address { Faker::Address.city }
  end
end
