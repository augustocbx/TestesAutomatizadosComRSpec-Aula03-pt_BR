require 'rails_helper'

RSpec.describe ClassesController, type: :controller do
  describe "GET #index" do
    it 'quero ver todos os assuntos cadastrados' do
      assuntos_criados = create_list(:auto, 5)
      get :index
      expect(assigns(:autos).size).to eq(5)
      expect(assigns(:autos)).to eq(assuntos_criados)
    end
  end

  describe "GET #show" do
    it 'quero ver um assunto que já existe' do
      assunto_criado = create(:assunto)
      get :show, id: assunto_criado.id

      expect(response).to have_http_status(:ok)
      expect(assigns(:assunto)).to eq(assunto_criado)
      expect(response).to render_template(:show)
    end
    it "Quero ver o status 'Não encontrado' quando pedir um assunto inexistente" do
      get :show, id: 99
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "POST #create" do
    it 'quero criar um assunto passando apenas o nome' do
      assunto_hash = attributes_for(:assunto)
      post :create, assunto_hash
      expect(response).to have_http_status(:created)
      expect(assigns(:assunto).nome).to eq(assunto_hash[:nome])
      expect(assigns(:message)).to match(/assunto criado com sucesso/i)
      expect(response).to render_template(:show)

    end
    it 'quero tentar criar um assunto sem nome, mas o sistema não deve permitir' do
      post :create, {}
      expect(assigns(:message)).to match(/nome é obrigatório/i)
      expect(response).to render_template(:new)
    end
  end

  describe "PUT #update" do
    it "quero alterar um assunto, colocando a string 'Tralalá'" do
      assunto_persistido = create(:assunto)
      put :update, {id: assunto_persistido.id, nome: 'Tralalá'}
      expect(assigns(:message)).to match(/assunto alterado com sucesso/i)
      expect(response).to render_template(:show)
      expect(assigns(:assunto).nome).to eq('Tralalá')
    end
    it "quero tentar alterar um assunto colocando o nome em branco, o sistema não deve permitir, dando a mensagem 'nome é obrigatório'" do
      assunto_persistido = create(:assunto)
      put :update, {id: assunto_persistido.id, nome: ''}
      expect(assigns(:message)).to match(/assunto não alterado/i)
      expect(assigns(:message)).to match(/nome é obrigatório/i)
      expect(response).to render_template(:edit)
      expect(assigns(:assunto).nome).to eq('')
    end

    it "quero tentar alterar um assunto que contenha autos relacionados, o sistema não deve permitir" do
      assunto_persistido = create(:assunto)
      create_list(:auto, 3, assunto: assunto_persistido)
      put :update, {id: assunto_persistido.id, nome: 'Outro assunto'}
      expect(assigns(:message)).to match(/assunto não alterado/i)
      expect(assigns(:message)).to match(/este assunto contém autos, portanto, não pode ser alterado/i)
      expect(response).to render_template(:edit)
    end
  end

  describe "DELETE #destroy" do
    it 'Quero remover um assunto sem autos relacionados' do
      create_list(:assunto, 2)
      assunto_persistido = create(:assunto)
      delete :destroy, {id: assunto_persistido.id}
      expect(assigns(:message)).to match(/assunto removido com sucesso/i)
      expect(response).to redirect_to(action: :index)

      get :index

      expect(assigns(:assuntos).size).to eq(2)
      expect(assigns(:assuntos)).not_to include(assunto_persistido)
    end

    it 'Quero remover um assunto com autos relacionados, o sistema não deve permitir' do
      assunto_persistido = create(:assunto)
      create_list(:auto, 3, assunto: assunto_persistido)
      delete :destroy, {id: assunto_persistido.id}
      expect(assigns(:message)).to match(/assunto não pode ser removido/i)
      expect(response).to redirect_to(action: :index)

      get :index

      expect(assigns(:assuntos).size).to eq(1)
      expect(assigns(:assuntos)).to include(assunto_persistido)
    end

    it "Quero remover um assunto inexistente, ver a mensagem 'este assunto não existe' e o status :not_found" do
      delete :destroy, {id: 99}
      expect(assigns(:message)).to match(/este assunto não existe/i)
      expect(response).to have_http_status(:not_found)
    end
  end

end
