FactoryBot.define do
  factory :message do
    group
    user
    body { Faker::OnePiece.quote }
  end
end
