shared_context :auto_shared do
  let(:autos_valido_let) do
    auto = Auto.new
    auto.classe = create(:classe)
    auto.assunto = create(:assunto)
    auto.observacao = 'Ojadsklfjadlskjfl asdfjlkasd f'
    auto.save
    auto
  end

end
