class DashboardController < ApplicationController
  def index
    @boards = Board.all
    session[:selected_board_id] = params[:selected_board_id].to_i if params[:selected_board_id].present?
    @board = Board.find_by_id(session[:selected_board_id])
  end
end
