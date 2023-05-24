class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, :except => [:index, :new, :create]

  def index
    @courses = Course.order("created_at DESC")
  end

  def new
    @course = current_user.courses.new
  end

  def create
    @course = current_user.courses.new(course_params)
    respond_to do |format|
      if @course.save
        format.html { redirect_to courses_url, notice: "Project was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def destroy
    respond_to do |format|
      if @course.destroy
        format.html { redirect_to courses_url, notice: "Project was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  def script
  end

  def editor
    @templates=Template.all
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :script)
  end
end