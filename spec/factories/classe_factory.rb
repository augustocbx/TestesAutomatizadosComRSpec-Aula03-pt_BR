FactoryGirl.define do
  factory :classe, class: Classe do
    nome { Faker::Lorem.word }
  end
end