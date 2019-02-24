FactoryBot.define do
    factory :user do
      name         { FFaker::Lorem.word }
      email        { FFaker::Internet.email }
      password     password {‘secret123’}
    end
   end

