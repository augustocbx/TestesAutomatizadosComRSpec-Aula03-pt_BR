FactoryGirl.define do
  factory :assunto, class: Assunto do
    nome { Faker::Lorem.word }
  end
end