class ReelsController < ApplicationController
  def index
    @reels = Reel.all
  end

  def new
    @reel = Reel.new
    @course = Course.find_by(id: params[:id])
    session[:id] = @course.id
  end

  def create
    id = session[:id]
    @reel = Reel.new(reel_params)
    if @reel.save
      redirect_to editor_course_url(id: id)
    else
      render "new"
    end
  end

  def reel_params
    params.require(:reel).permit(:file)
  end
end
