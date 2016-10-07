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

require 'rails_helper'
require 'shareds/auto_shared'
require 'shareds/classe_shared'
require 'shareds/assunto_shared'

RSpec.describe Auto, type: :model do
  include_context(:auto_shared)
  include_context(:classe_shared)
  include_context(:assunto_shared)
  describe "Testar a criação dos autos" do

    it "não deve salvar um autos sem que todos os campos estejam preenchidos" do
      auto = Auto.new
      expect(auto.save).to be_falsey
    end

    it "deve ser salvo quando todos os campos forem preenchidos" do
      auto = Auto.new
      auto.classe = classe_valida_let
      auto.assunto = assunto_valido_let
      auto.observacao = 'Ojadsklfjadlskjfl asdfjlkasd f'
      expect(auto.save).to be_truthy
    end
  end
  describe "Testar a alteração dos autos" do

    subject do
      auto = Auto.new
      auto.classe = 'asdfjaklsdjflaksdjf'
      auto.assunto = 'uroiweuroiw'
      auto.observacao = 'jhdfdfhdsajfasdkljflajsdkfksa'
      auto.save
      auto
    end

    it "a classe não pode ser 'Nova'" do
      autos_valido_let.classe = classe_nova_let
      expect(autos_valido_let.save).to be_falsey
    end

    it "checar a alteração dos autos válida" do
      autos_valido_let.observacao = 'adsfasdfa'
      expect(autos_valido_let.save!).to be_truthy
    end

    it "o assunto não pode ser 'Férias'" do
      autos_valido_let.assunto = assunto_ferias_let
      expect(autos_valido_let.save).to be_falsey
    end
  end
end
