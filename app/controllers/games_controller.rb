class GamesController < ApplicationController
  def index
    render :home
  end

  def new
    @number = []
    Move.delete_all
    Cell.delete_all
    @game = Game.create
    Cell.create_grid(@game.id)
    @moves = Move.all
    @cells = Cell.all.order(:player,:x,:y)
    @player_id = 1

  end
  def create
    # @game.create_game
  end

  def update

    @cells = Cell.all.order(:id,:player,:x,:y,:hit)
    @game = Game.find(params[:id].to_i)
    @cell = Cell.find(params[:cell].fetch(:cell_id).to_i)
    @cell_left = Cell.where(x:(@cell.x - 1))
    @cell.update({:ship => params[:cell].fetch(:ship)})
    @player_id = 1
    @number = Cell.where(player:1, ship:true)
    render :new
  end
end
