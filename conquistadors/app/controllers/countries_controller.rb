class CountriesController < ApplicationController
  before_action :require_login
  before_action :set_country, only: [:edit, :update, :destroy]

  # GET /countries
  # GET /countries.json
  def index
    @countries = Country.all
  end

  # GET /countries/1
  # GET /countries/1.json
  def show
    @country = Country.find(params[:id])
  end

  # GET /countries/new
  def new
    @country = Country.new
    @player = current_player
    # @country = current_player.country.new

  end

  # GET /countries/1/edit
  def edit
    @player = current_player
  end

  # POST /countries
  # POST /countries.json
  def create
    @country = Country.new(country_params)
    @player = current_player
    @country.update(player_id: @player.id)


    respond_to do |format|
      if @country.save
        format.html { redirect_to @player, notice: 'Country was successfully created.' }
        format.json { render :show, status: :created, location: @country }
      else
        format.html { render :new }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /countries/1
  # PATCH/PUT /countries/1.json
  def update
    @player = current_player
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to @player, notice: 'Country was successfully updated.' }
        format.json { render :show, status: :ok, location: @country }
      else
        format.html { render :edit }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    @country.destroy
    respond_to do |format|
      format.html { redirect_to countries_url, notice: 'Country was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = current_player.countries.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def country_params
      if action_name == "index"
        params.require(:country).permit(:name, :player_id, :flag, :motto, :employment, :tax_rate, :wealth, :population)
      elsif action_name == "create"
        params.require(:country).permit(:name, :player_id, :flag, :motto, :employment, :tax_rate)
      end
    end
end
