class ProduitsController < ApplicationController
  before_action :set_produit, only: [:show, :edit, :update, :destroy]

  # GET /produits
  # GET /produits.json
  def index
    @produits = Produit.all
  end

  # GET /produits/1
  # GET /produits/1.json
  def show
  end

  # GET /produits/new
  def new
    @produit = Produit.new
  end

  # GET /produits/1/edit
  def edit
  end

  # POST /produits
  # POST /produits.json
  def create
    @produit = Produit.new(produit_params)
    @paniers = Panier.all.order('name')
    respond_to do |format|
      if @produit.save
        format.js {}
      else
        format.js {}
      end
    end
  end

  # PATCH/PUT /produits/1
  # PATCH/PUT /produits/1.json
  def update
    @paniers = Panier.all.order('name')
    respond_to do |format|
      if @produit.update(produit_params)
        format.js {}
      else
        format.js {}
      end
    end
  end

  # DELETE /produits/1
  # DELETE /produits/1.json
  def destroy
    @identifiant = @produit.id
    @panier = @produit.panier
    @produit.destroy
    respond_to do |format|
      format.js {}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produit
      @produit = Produit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def produit_params
      params.require(:produit).permit(:name, :price, :panier_id)
    end
end
