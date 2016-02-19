class CapstonesController < ApplicationController
  def index
    @capstones = Capstone.all

    if params[:search]
      @capstones = @capstones.search(params[:search])
    else
      @capstones = @capstones.all
    end

    if params[:filter] && params[:filter_order]
      @capstones = @capstones.order(params[:filter] => params[:filter_order])
    end
  end

  def show
    @capstone = Capstone.find(params[:id])
  end
end
