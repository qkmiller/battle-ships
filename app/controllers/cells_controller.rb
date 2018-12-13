class CellsController < ApplicationController

  def index

    # Cell.delete_all
    # Cell.create_grid
    # Cell.pick_random
    @cells = Cell.all.order(:player,:x,:y)
    @moves = Move.all
    @player_id = Move.who_turn
    # @moves = Move.all
  end


  def update
    @cells = Cell.all.order(:player,:x,:y)
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
    #
    # @cell.update({:ship => true})
    # @move = Move.create({:x => @cell.x, :y => @cell.y, :hit => @cell.ship})

  end
end
