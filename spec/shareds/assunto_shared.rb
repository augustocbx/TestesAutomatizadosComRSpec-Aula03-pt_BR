shared_context :assunto_shared do
  let(:assunto_valido_let) do
    create(:assunto)
  end
  let(:assunto_ferias_let) do
    create(:assunto, :ferias)
  end

  # HOOKS
  before(:each) do
    puts 'Um pra cada IT'
  end
  before(:all) do
    puts 'Um pra dodos do mesmo arquivo'
  end
  before(:suite) do
    puts 'Roda antes de carregar o contexto'
  end


end
