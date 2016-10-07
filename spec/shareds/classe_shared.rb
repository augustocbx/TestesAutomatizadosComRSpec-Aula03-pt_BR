shared_context :classe_shared do
  let(:classe_valida_let) do
    create(:classe)
  end
  let(:classe_nova_let) do
    create(:classe, :nova)
  end

end
