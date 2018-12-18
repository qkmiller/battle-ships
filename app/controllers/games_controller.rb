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
    binding.pry
    @cell = Cell.find(params[:cell_id])
    @cell.update({:ship => params[:ship]})
    render :new
  end
end
# ()
