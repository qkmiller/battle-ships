class CellsController < ApplicationController

  def index

    # Cell.create_grid
    # @game = Game.find(params[:game_id])
    # @game.create_game
    @game = Game.find(params[:game_id])
    @game.create_game(params[:game].fetch(:player_1_name))
    
    # @game.create_game(params[:player_1_name],params[:player_2_name])
    @cells = Cell.all.order(:player,:x,:y)
    @moves = Move.all
    Cell.pick_random
    @player_id = Move.who_turn
    # @moves = Move.all
  end

  def update
    @cells = Cell.all.order(:id,:player,:x,:y,:hit)
    @cell = Cell.find(params[:id])
    Move.make_move(@cell.x,@cell.y)
    @moves = Move.all
    @player_id = Move.who_turn

    if Cell.win_check == "p1 wins"
      render :p1_wins
    elsif Cell.win_check == "p2 wins"
      render :p2_wins
    else
      render :index
    end

  end
end
