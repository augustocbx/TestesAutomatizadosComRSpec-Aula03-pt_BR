# == Schema Information
#
# Table name: classes
#
#  id         :integer          not null, primary key
#  nome       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :classe, class: Classe do
    nome { Faker::Lorem.word }
    trait :nova do
      nome 'Nova'
    end
  end
end
