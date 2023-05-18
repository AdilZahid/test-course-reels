class ReelsController < ApplicationController
  def index
    @reels = Reel.all
  end

  def new
    @reel = Reel.new
  end

  def create
    @reel = Reel.new(reel_params)
    if @reel.save
      redirect_to reels_path
    else
      render "new"
    end
  end

  def reel_params
    params.require(:reel).permit(:file)
  end
end
