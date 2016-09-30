shared_context :auto_shared do
  before(:each) do
    @auto = Auto.new
    @auto.classe = 'Minha classe'
    @auto.assunto = 'Meu assunto'
    @auto.observacao = 'Ojadsklfjadlskjfl asdfjlkasd f'
    p "#{auto.id} before(:each)"
    @auto.save
  end

  def autos_valido_method
    auto = Auto.new
    auto.classe = 'Minha classe'
    auto.assunto = 'Meu assunto'
    auto.observacao = 'Ojadsklfjadlskjfl asdfjlkasd f'
    auto.save
    p "#{auto.id} method"
    auto
  end

  let(:autos_valido_let) do
    auto = Auto.new
    auto.classe = 'Minha classe'
    auto.assunto = 'Meu assunto'
    auto.observacao = 'Ojadsklfjadlskjfl asdfjlkasd f'
    auto.save
    p "#{auto.id} let"
    auto
  end

end
