class AtaController < ApplicationController
  load_and_authorize_resource
  before_action :set_atum, only: [:show, :edit, :update, :destroy]

  # GET /ata
  # GET /ata.json
  def index
    @ata = Atum.all
  end

  # GET /ata/1
  # GET /ata/1.json
  def show
  end

  # GET /ata/new
  def new
    @atum = Atum.new
  end

  # GET /ata/1/edit
  def edit
  end

  # POST /ata
  # POST /ata.json
  def create
    @atum = Atum.new(atum_params)

    respond_to do |format|
      if @atum.save
        format.html { redirect_to @atum, notice: 'Atum was successfully created.' }
        format.json { render :show, status: :created, location: @atum }
      else
        format.html { render :new }
        format.json { render json: @atum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ata/1
  # PATCH/PUT /ata/1.json
  def update
    @teste=Atum.new(atum_params)
    if @atum.status =="finalizada" 
        redirect_to @atum , notice: 'Desculpe mas,ata finalizada não pode ser auterada.'






     

     
    else


    respond_to do |format|
      if @atum.update(atum_params)
       @reuniao=Reuniao.buscarAta(@atum.id)
       @reuniao[0].status="finalizada"
       @reuniao[0].save
        format.html { redirect_to @atum, notice: 'Atum was successfully updated.' }
        format.json { render :show, status: :ok, location: @atum }
      else
        format.html { render :edit }
        format.json { render json: @atum.errors, status: :unprocessable_entity }
      end
    end
   end
  end

  # DELETE /ata/1
  # DELETE /ata/1.json
  def destroy
    @atum.destroy
    respond_to do |format|
      format.html { redirect_to ata_url, notice: 'Atum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atum
      @atum = Atum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atum_params
      params.require(:atum).permit(:status, :pdfAta,:documento)
    end
end
