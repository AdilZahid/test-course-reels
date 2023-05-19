class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: %i[ show edit update destroy ]

  def index
    @courses = Course.all
    @courses = @courses.reverse
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    respond_to do |format|
      if @course.save
        format.html { redirect_to courses_url, notice: "Project was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def destroy
    respond_to do |format|
      if @course.destroy
        format.html { redirect_to courses_url, notice: "Project was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :script)
  end
end