class CellsController < ApplicationController

  def index
    Cell.delete_all
    Cell.create_grid
    @cells = Cell.all
  end

end
