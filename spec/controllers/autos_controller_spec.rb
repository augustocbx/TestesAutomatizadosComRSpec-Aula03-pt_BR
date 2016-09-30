require 'rails_helper'

RSpec.describe AutosController, type: :controller do

  describe "GET #index" do
    it "assigns all autos as @autos" do
      autos = create_list(:auto, 5)
      get :index
      expect(assigns(:autos)).to eq(autos)
    end
  end

  describe "GET #show" do
    it "assigns the requested auto as @auto" do
      auto = create(:auto)
      get :show, id: auto.id
      expect(assigns(:auto)).to eq(auto)
    end
  end

  describe "GET #new" do
    it "assigns a new auto as @auto" do
      get :new, params: {}
      expect(assigns(:auto)).to be_a_new(Auto)
    end
  end

  describe "GET #edit" do
    it "assigns the requested auto as @auto" do
      auto = auto(:create)
      get :edit, id: auto.auto.id
      expect(assigns(:auto)).to eq(auto)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Auto" do

        classe = create(:classe)
        assunto = create(:assunto)

        post :create, {auto: attributes_for(:auto)}.merge!(
                        classe_id: classe.id,
                        assunto_id: assunto.id
                    )

        expect(assigns(:auto)).to be_a(Auto)
        expect(assigns(:auto)).to be_persisted
        expect(response).to redirect_to(Auto.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved auto as @auto" do
        post :create, params: {auto: invalid_attributes}, session: valid_session
        expect(assigns(:auto)).to be_a_new(Auto)
      end

      it "re-renders the 'new' template" do
        post :create, params: {auto: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested auto" do
        auto = Auto.create! valid_attributes
        put :update, params: {id: auto.to_param, auto: new_attributes}, session: valid_session
        auto.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested auto as @auto" do
        auto = Auto.create! valid_attributes
        put :update, params: {id: auto.to_param, auto: valid_attributes}, session: valid_session
        expect(assigns(:auto)).to eq(auto)
      end

      it "redirects to the auto" do
        auto = Auto.create! valid_attributes
        put :update, params: {id: auto.to_param, auto: valid_attributes}, session: valid_session
        expect(response).to redirect_to(auto)
      end
    end

    context "with invalid params" do
      it "assigns the auto as @auto" do
        auto = Auto.create! valid_attributes
        put :update, params: {id: auto.to_param, auto: invalid_attributes}, session: valid_session
        expect(assigns(:auto)).to eq(auto)
      end

      it "re-renders the 'edit' template" do
        auto = Auto.create! valid_attributes
        put :update, params: {id: auto.to_param, auto: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested auto" do
      auto = Auto.create! valid_attributes
      expect {
        delete :destroy, params: {id: auto.to_param}, session: valid_session
      }.to change(Auto, :count).by(-1)
    end

    it "redirects to the autos list" do
      auto = Auto.create! valid_attributes
      delete :destroy, params: {id: auto.to_param}, session: valid_session
      expect(response).to redirect_to(autos_url)
    end
  end

end
