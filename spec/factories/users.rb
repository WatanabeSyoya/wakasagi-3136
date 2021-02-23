FactoryBot.define do
  factory :user do
    nickname                     { "ショウヤ" }
    email                        { Faker::Internet.free_email }
    password                     { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation        { password }
    skill                        { '名人' }
  end
end