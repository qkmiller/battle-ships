class CellsController < ApplicationController

  def index
  
    Cell.delete_all
    Cell.create_grid
    @cells = Cell.all
    @moves = Move.all
  end


  def update
    @cells = Cell.all
    @cell = Cell.find(params[:id])
    @cell.update({:ship => true})
    @move = Move.create({:x => @cell.x, :y => @cell.y, :hit => @cell.ship})
    render :index
  end
end
