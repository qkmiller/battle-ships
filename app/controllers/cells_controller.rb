class CellsController < ApplicationController
  def index
    @cells = Cell.all
  end

  def show
    @cell = Cell.find(params[:id])
  end

  def new
    @cell = Cell.new
  end

  def create
    @cell = Cell.new(cell_params)
    if @cell.save
      flash[:notice] = "Cell successfully added!"
      redirect_to cells_path
    else
      render :new
    end
  end

  def edit
    @cell = Cell.find(params[:id])
  end

  def update
    @cell = Cell.find(params[:id])
    if @cell.update(cell_params)
      redirect_to cells_path
    else
      render :edit
    end
  end

  def destroy
    @cell = Cell.find(params[:id])
    @cell.destroy
    redirect_to cells_path
  end
private
  def cell_params
    params.require(:cell).permit(:x,:y,:ship)
  end
end
