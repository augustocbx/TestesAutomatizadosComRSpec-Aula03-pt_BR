class AssuntosController < ApplicationController
  def new
    @assunto = Assunto.new
  end


  def index
    @assuntos = Assunto.all
    render :index
  end

  def show
    @assunto = Assunto.find_by(id: params[:id])
    if @assunto.present?
      render :show
    else
      head :not_found
    end
  end

  def create
    @assunto = Assunto.new(assunto_params)
    if @assunto.save
      @message = "Assunto criado com sucesso."
      render :show, status: :created
    else
      @message = "Assunto não criado. "
      @message << @assunto.errors.full_messages.to_s
      render :new
    end
  end

  def update
    @assunto = Assunto.find_by(id: params[:id])
    @assunto.attributes = assunto_params
    if @assunto.save
      @message = "Assunto alterado com sucesso."
      render :show, status: :ok
    else
      @message = "Assunto não alterado. "
      @message << @assunto.errors.full_messages.to_s
      render :edit
    end
  end

  def destroy
    @assunto = Assunto.find_by(id: params[:id])
    if @assunto.present?
      if @assunto.destroy
        @message = "Assunto removido com sucesso!"
        redirect_to action: :index
      else
        @message = "O assunto não pode ser removido. "
        @message << @assunto.errors.full_messages.to_s
        redirect_to action: :index
      end

    else
      @message = "Este assunto não existe."
      head :not_found
    end
  end

  private
  def assunto_params
    params.permit(:nome)
  end

end
