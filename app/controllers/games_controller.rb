class GamesController < ApplicationController
  def index
    render :home
  end

  def new
    Move.delete_all
    Cell.delete_all
    @game = Game.create
    Cell.create_grid(@game.id)

    @cells = Cell.all.order(:player,:x,:y)
  end
  def create
    # @game.create_game
  end

  def update
    @cells = Cell.all.order(:id,:player,:x,:y,:hit)
    @game = Game.find(params[:id].to_i)
    @cell = Cell.find(params[:cell].fetch(:cell_id).to_i)
    @cell.update({:ship => params[:cell].fetch(:ship)})
    render :new
  end
end
# ()
