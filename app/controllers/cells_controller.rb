class CellsController < ApplicationController

  def index

    # Cell.create_grid
    # @game = Game.find(params[:game_id])
    # @game.create_game
    @game = Game.find(params[:game_id])
    @comp_name = Faker::Name.name
    @game.create_game(current_user.username, @comp_name)

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
    @game = Game.find(@cell.game_id)
    Move.make_move(@cell.x,@cell.y)
    if Cell.win_check == "p1 wins"
      render :p1_wins
    elsif Cell.win_check == "p2 wins"
      render :p2_wins
    else
      @moves = Move.all
      @player_id = Move.who_turn
      @comp_name = @game.player_2_name
      @enemy_cell = Cell.all.where(player:1, hit:nil ).order("RANDOM()").first
      Move.make_move(@enemy_cell.x,@enemy_cell.y)
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
end
