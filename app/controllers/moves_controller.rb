class MovesController < ApplicationController

  def create
    @cells = Cell.all()
    @move = Move.new(move_params)

    @move.save

  end


  private
    def move_params
      params.require(:cell).permit(:x, :y, :player_id)
    end


end


(cells.where(x: 2, y: 2, ship: true))
(cells.where(x: 2, y: 1, ship: true))
