class CellsController < ApplicationController

  def index
    Cell.delete_all
    Cell.create_grid
    @cells = Cell.all
    @cells_1 = @cells.select { |cell| cell.x == 1 }
    @cells_2 = @cells.select { |cell| cell.x == 2 }
    @cells_3 = @cells.select { |cell| cell.x == 3 }
    @moves = Move.all
  end

  def update
    @cell = Cell.find(params[:id])
    @move = Move.create({:x => @cell.x, :y => @cell.y, :hit => @cell.ship})
    @cell.update({:hit => true})
    @cells = Cell.all
    @cells_1 = @cells.select { |cell| cell.x == 1 }
    @cells_2 = @cells.select { |cell| cell.x == 2 }
    @cells_3 = @cells.select { |cell| cell.x == 3 }
    # @cell.update({:ship => true})
    render :index
  end
end
