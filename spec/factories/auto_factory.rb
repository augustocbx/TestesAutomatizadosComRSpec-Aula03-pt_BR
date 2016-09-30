FactoryGirl.define do
  factory :auto, class: Auto do
    observacoes { Faker::Lorem.paragraph(2) }
  end
end