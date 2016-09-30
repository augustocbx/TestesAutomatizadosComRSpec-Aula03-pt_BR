# == Schema Information
#
# Table name: autos
#
#  id         :integer          not null, primary key
#  observacao :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  classe_id  :integer
#  assunto_id :integer
#

FactoryGirl.define do
  factory :auto, class: Auto do
    association :classe, factory: :classe, strategy: :create
    association :assunto, factory: :assunto, strategy: :create

    observacao { Faker::Lorem.paragraph(2) }
  end
end
