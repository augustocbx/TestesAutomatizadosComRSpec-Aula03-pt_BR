require 'rails_helper'
require 'shareds/auto_shared'

RSpec.describe Auto, type: :model do
  describe "Testar a criação dos autos" do

    it "não deve salvar um autos sem que todos os campos estejam preenchidos" do
      auto = Auto.new
      expect(auto.save).to be_falsey
    end

    it "deve ser salvo quando todos os campos forem preenchidos" do
      auto = Auto.new
      auto.classe = 'Minha classe'
      auto.assunto = 'Meu assunto'
      auto.observacao = 'Ojadsklfjadlskjfl asdfjlkasd f'
      expect(auto.save).to be_truthy
    end
  end
  describe "Testar a alteração dos autos" do
    include_context(:auto_shared)

    subject do
      auto = Auto.new
      auto.classe = 'asdfjaklsdjflaksdjf'
      auto.assunto = 'uroiweuroiw'
      auto.observacao = 'jhdfdfhdsajfasdkljflajsdkfksa'
      auto.save
      auto
    end

    it "a classe não pode ser 'Nova'" do
      @auto.classe = 'Nova'
      expect(@auto.save).to be_falsey
    end

    it "checar a alteração dos autos válida" do
      @auto.observacao = 'adsfasdfa'
      expect(@auto.save!).to be_truthy
    end

    it "o assunto não pode ser 'Férias'" do
      @auto.assunto = 'Férias'
      expect(@auto.save).to be_falsey
    end
  end
  describe "Testar o subject" do
    it "o que é?" do
      p subject
    end
  end
end
