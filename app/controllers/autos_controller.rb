class AutosController < ApplicationController
  before_action :set_auto, only: [:show, :edit, :update, :destroy]

  # GET /autos
  # GET /autos.json
  def index
    @autos = Auto.all
  end

  # GET /autos/1
  # GET /autos/1.json
  def show
    if !@auto.present?
      head :not_found
    end
  end

  # GET /autos/new
  def new
    @auto = Auto.new
  end

  # GET /autos/1/edit
  def edit
  end

  # POST /autos
  # POST /autos.json
  def create
    @auto = Auto.new(auto_params)
    if @auto.save
      @message = "Auto criado com sucesso."
      render :show, status: :created
    else
      @message = "Auto não criado. "
      @message << @auto.errors.full_messages.to_s
      render :new
    end
  end

  # PATCH/PUT /autos/1
  # PATCH/PUT /autos/1.json
  def update
    respond_to do |format|
      if @auto.update(auto_params)
        format.html { redirect_to @auto, notice: 'Auto was successfully updated.' }
        format.json { render :show, status: :ok, location: @auto }
      else
        format.html { render :edit }
        format.json { render json: @auto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /autos/1
  # DELETE /autos/1.json
  def destroy
    @auto.destroy
    respond_to do |format|
      format.html { redirect_to autos_url, notice: 'Auto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auto
      @auto = Auto.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auto_params
      params.permit(:observacao, :classe_id, :assunto_id)
    end
end
