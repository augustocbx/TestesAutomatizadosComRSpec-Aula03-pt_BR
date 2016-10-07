# == Schema Information
#
# Table name: assuntos
#
#  id         :integer          not null, primary key
#  nome       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :assunto, class: Assunto do
    nome { Faker::Lorem.word }
    trait :ferias do
      nome 'Férias'
    end
  end
end
