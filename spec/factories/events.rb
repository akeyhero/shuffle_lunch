FactoryBot.define do
  factory :event do
    title            { Faker::Food.dish }
    date             { Faker::Date.between(Date.tomorrow, 2.weeks.from_now) }
    min_member       { [nil, 1, 2].sample }
    max_member       { [nil, 4, 6].sample }
    max_group_member { [nil, 2, 4].sample }
    description      { Faker::Lorem.paragraph }
  end
end
