class CapstonesController < ApplicationController
  def index
    @capstones = Capstone.all

    if params[:search]
    #   @capstones = Capstone.search(params[:search])
    # # else
      @capstones = Capstone.all
    end

    if params[:filter] && params[:filter_order]
      @capstones = @capstones.order(params[:filter] => params[:filter_order])
    end
  end

  def show
    @capstone = Capstone.find(params[:id])
  end



end
