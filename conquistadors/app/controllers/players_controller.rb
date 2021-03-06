class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players
  # GET /players.json
  def index
    @players = Player.all
  end


  def login
    @player = Player.find_by_email(params[:email])
    if @player && @player.authenticate(params[:password])
      session[:player_id] = @player.id
      if @player.country
        redirect_to player_country_path(@player, @player.country.id)
      else
        redirect_to new_player_country_path(@player)
      end
    else
      render :new, notice: 'Invalid Login'
    end
  end

  def logout
    reset_session
    redirect_to new_player_path, notice: 'You have been logged out'
  end

  # GET /players/1
  # GET /players/1.json
  def show
    # @country = Country.find_by(player_id: current_player.id)
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
    @player = current_player
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)
    respond_to do |format|
      if @player.save
        session[:player_id] = @player.id
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:name, :title, :email, :password, :password_confirmation)
    end
end
