# Helper for controller and views to provide
# session related methods

module SessionHelper

  #returns currently logged in player
  def current_player
    @current_player ||= session[:player_id] ? Player.find_by_id(session[:player_id]) : nil
  end
end
