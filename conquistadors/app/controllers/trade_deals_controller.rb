class TradeDealsController < ApplicationController
  before_action :set_trade_deal, only: [:show, :edit, :update, :destroy]

  # GET /trade_deals
  # GET /trade_deals.json
  def index
    @trade_deals = TradeDeal.all
  end

  # GET /trade_deals/1
  # GET /trade_deals/1.json
  def show
  end

  # GET /trade_deals/new
  def new
    @trade_deal = TradeDeal.new
    @trade_deal.player_id = current_player
  end

  # GET /trade_deals/1/edit
  def edit
  end

  # POST /trade_deals
  # POST /trade_deals.json
  def create
    @trade_deal = TradeDeal.new(trade_deal_params)
<<<<<<< HEAD
    @player = current_player
    @trade_deal.update(player_id: @player.id)
=======
    @trade_deal.player_id = current_player.id

>>>>>>> e3211766402fe7631521481db4366b952176dc3f
    respond_to do |format|
      if @trade_deal.save
        format.html { redirect_to @trade_deal, notice: 'Trade deal was successfully created.' }
        format.json { render :show, status: :created, location: @trade_deal }
      else
        binding.pry
        format.html { render :new }
        format.json { render json: @trade_deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trade_deals/1
  # PATCH/PUT /trade_deals/1.json
  def update
    respond_to do |format|
      if @trade_deal.update(trade_deal_params)
        format.html { redirect_to @trade_deal, notice: 'Trade deal was successfully updated.' }
        format.json { render :show, status: :ok, location: @trade_deal }
      else
        format.html { render :edit }
        format.json { render json: @trade_deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trade_deals/1
  # DELETE /trade_deals/1.json
  def destroy
    @trade_deal.destroy
    respond_to do |format|
      format.html { redirect_to trade_deals_url, notice: 'Trade deal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade_deal
      @trade_deal = TradeDeal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trade_deal_params
      params.require(:trade_deal).permit(:player_id, :country_resource_id, :cost, :quantity, :agreed)
    end
  end
