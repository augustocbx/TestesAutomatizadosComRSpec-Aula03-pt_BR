class ClassesController < ApplicationController
  def new
    @classe = Classe.new
  end

  def edit
    @classe = Classe.find_by(id: params[:id])
  end


  def index
    if params[:message].present?
      @message = params[:message]
    end
    @classes = Classe.all
    render :index
  end

  def show
    @classe = Classe.find_by(id: params[:id])
    if @classe.present?
      render :show
    else
      head :not_found
    end
  end

  def create
    @classe = Classe.new(classe_params)
    if @classe.save
      @message = "Classe criada com sucesso."
      render :show, status: :created
    else
      @message = "Classe não criada. "
      @message << @classe.errors.full_messages.to_s
      render :new
    end
  end

  def update
    @classe = Classe.find_by(id: params[:id])
    @classe.attributes = classe_params
    if @classe.save
      @message = "Classe alterada com sucesso."
      render :show, status: :ok
    else
      @message = "Classe não alterada. "
      @message << @classe.errors.full_messages.to_s
      render :edit
    end
  end

  def destroy
    @classe = Classe.find_by(id: params[:id])
    if @classe.present?
      if @classe.destroy
        @message = "Classe removida com sucesso!"
        redirect_to action: :index, message: @message
      else
        @message = "O classe não pode ser removida. "
        @message << @classe.errors.full_messages.to_s
        redirect_to action: :index, message: @message
      end

    else
      @message = "Esta classe não existe."
      head :not_found
    end
  end

  private
  def classe_params
    params.permit(classe: :nome)[:classe]
  end

end
