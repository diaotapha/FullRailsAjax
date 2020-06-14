class PaniersController < ApplicationController
  before_action :set_panier, only: [:show, :edit, :update, :destroy]

  # GET /paniers
  # GET /paniers.json
  def index
    @paniers = Panier.all.order('name')
    if params[:filter].present? 
     
      if Panier.find_by_name(params[:filter]).present?
        @panier = Panier.find_by_name(params[:filter])
        @produits =  @panier.produits.order('name')
        @name = @panier.name
      else
        @produits =   Produit.all.order('name')
        @name = "tout"
      end

    else
      @produits =  Produit.all.order('name')
    end
    respond_to do |format|
        format.js{}
        format.html{}
    end
  end

  # GET /paniers/1
  # GET /paniers/1.json
  def show
  end

  # GET /paniers/new
  def new
    @panier = Panier.new
  end

  # GET /paniers/1/edit
  def edit
  end

  # POST /paniers
  # POST /paniers.json
  def create
    @panier = Panier.new(panier_params)

    respond_to do |format|
      if @panier.save
        @paniers = Panier.all.order('name')
        @produit = Produit.new
        format.js{}
      else
        format.js {}
      end
    end
  end

  # PATCH/PUT /paniers/1
  # PATCH/PUT /paniers/1.json
  def update
    respond_to do |format|
      if @panier.update(panier_params)
        format.html { redirect_to @panier, notice: 'Panier was successfully updated.' }
        format.json { render :show, status: :ok, location: @panier }
      else
        format.html { render :edit }
        format.json { render json: @panier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paniers/1
  # DELETE /paniers/1.json
  def destroy
    @panier.destroy
    respond_to do |format|
      format.html { redirect_to paniers_url, notice: 'Panier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_panier
      @panier = Panier.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def panier_params
      params.require(:panier).permit(:name)
    end
end
